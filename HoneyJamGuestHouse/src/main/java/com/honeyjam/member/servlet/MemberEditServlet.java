package com.honeyjam.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.exception.DuplicatedNicknameException;
import com.honeyjam.exception.DuplicatedPhoneException;
import com.honeyjam.member.service.MemberService;
import com.honeyjam.member.service.MemberServiceImpl;
import com.honeyjam.vo.Member;


@WebServlet("/memberEdit")
public class MemberEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//1.요청파라미터 조회
		Member member = (Member)session.getAttribute("loginMember");
		String email = member.getEmail();
		String oldPassword = request.getParameter("oldPass");
		String newPassword = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String phoneNum = request.getParameter("phoneNum");
		
		//2. 회원정보수정한거 DB에 저장
		MemberService service = MemberServiceImpl.getInstance();
		
		try {
			if(newPassword.isEmpty()) {
				Member oldMember = new Member(email,oldPassword,nickname,phoneNum,1);
				service.updateMember(oldMember);
				session.setAttribute("loginMember", oldMember);
			}else {
				Member newMember = new Member(email,newPassword,nickname,phoneNum,1);
				service.updateMember(newMember);
				session.setAttribute("loginMember", newMember);
			}
			request.getRequestDispatcher("/member/mypage.jsp").forward(request, response);
		}catch(DuplicatedNicknameException | DuplicatedPhoneException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/member/edit.jsp").forward(request, response);
		}

		
	}

}
