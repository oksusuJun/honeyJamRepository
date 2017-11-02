package com.honeyjam.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;

/**
 * Servlet implementation class AdminDeleteMember
 */
@WebServlet("/AdminDeleteMember")
public class AdminDeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String deleteEmail = request.getParameter("delete_email");
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member.getEmail().equals("admin")) {
			MemberService service= MemberServiceImpl.getInstance();
			service.removeMemberById(deleteEmail);
			
			//있는 이메일인지 확인해야함 
			
			response.sendRedirect("/HoneyJamGuestHouse/member/mypage.jsp");
			
		}else {
			response.sendRedirect("/HoneyJamGuestHouse/main.jsp");
		}
		
	}

}
