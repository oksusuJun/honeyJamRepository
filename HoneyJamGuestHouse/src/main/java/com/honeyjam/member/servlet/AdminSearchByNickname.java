package com.honeyjam.member.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;

/**
 * Servlet implementation class AdminSearchByNickname
 */
@WebServlet("/adminSearchByNickname")
public class AdminSearchByNickname extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nickname = request.getParameter("search_nickname");
		
		MemberService service = MemberServiceImpl.getInstance();
		
		Member member = service.findMemberNickname(nickname);
		
		System.out.println(member);
		
		if(member == null) {
			request.setAttribute("errorMessage", "없는 회원입니다");
			request.getRequestDispatcher("/member/admin.jsp").forward(request, response);
			
		}else {
			request.setAttribute("member", member);
			request.getRequestDispatcher("/member/admin_view_member.jsp").forward(request, response);
		}
		
	}

}
