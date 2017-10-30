package com.honeyjam.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.exception.LoginFailException;
import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try {
			MemberService service= MemberServiceImpl.getInstance();
			Member member = service.authenticate(email, password);
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
		
			request.getRequestDispatcher("/main.jsp").forward(request, response);
			
		}catch(LoginFailException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		}
		
	}

}
