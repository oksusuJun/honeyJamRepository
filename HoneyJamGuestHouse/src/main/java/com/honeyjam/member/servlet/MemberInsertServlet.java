package com.honeyjam.member.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.exception.DuplicatedIdException;
import com.honeyjam.exception.DuplicatedNicknameException;
import com.honeyjam.exception.DuplicatedPhoneException;
import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;


@WebServlet("/memberInsert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1.요청파라미터
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String nickname=request.getParameter("nickname");
		String phoneNum =request.getParameter("phoneNum");
		
		MemberService service = MemberServiceImpl.getInstance();
		try {
			service.addMember(new Member(email,password,nickname,phoneNum,1));
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
			
			
		}catch(DuplicatedIdException e) {
			request.setAttribute("content", e.getDuplicatedId());
			request.setAttribute("errorMessage", e.getMessage());
			
			request.getRequestDispatcher("/member/join.jsp").forward(request, response);
		}catch(DuplicatedPhoneException e) {
			request.setAttribute("content", e.getDuplicatedPhone());
			request.setAttribute("errorMessage", e.getMessage());
			
			request.getRequestDispatcher("/member/join.jsp").forward(request, response);
		}catch(DuplicatedNicknameException e) {
			request.setAttribute("content", e.getDuplicateNickname());
			request.setAttribute("errorMessage", e.getMessage());
			
			request.getRequestDispatcher("/member/join.jsp").forward(request, response);
		}
	
	
	}

}
