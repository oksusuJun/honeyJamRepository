package com.honeyjam.member.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.exception.LoginFailException;
import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;


@WebServlet("/deleteMember")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			try {
				MemberService service= MemberServiceImpl.getInstance();
				Member member = service.authenticate(email, password);
				
				service.removeMemberById(email);
				response.sendRedirect(getServletContext().getInitParameter("rootPath")+"/main.jsp");
				
			}catch(LoginFailException e){
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/member/delete.jsp").forward(request, response);
				
			}
	}

}
