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
 * Servlet implementation class MemberSelectServlet
 */
@WebServlet("/memberSelect")
public class MemberSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberService service = MemberServiceImpl.getInstance();
		Member member = new Member();
		// 요청 파라미터 조회
		try {

			String findInfo = request.getParameter("phoneNum"); // 아이디 조회 parameter
			if (findInfo == null) { // 아이디로 패스워드 조회
				findInfo = request.getParameter("email");
				String findInPhone = request.getParameter("PhoneNumber");
				System.out.println("아이디로 패스워드 조회- email : " + findInfo + "&" + findInPhone);
				member = service.findMemberByIdnPhone(findInfo, findInPhone);
				System.out.println("핸드폰번호로 ID 조회 - "+member);
				String password = member.getPassword();
				System.out.println(password);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/member/findMemberResult.jsp").forward(request, response);

			} else { // 핸드폰 번호로 ID 조회
				System.out.println("핸드폰번호로 ID 조회 - phone : " + findInfo);
				member = service.findMemberByPhone(findInfo);
				System.out.println("핸드폰번호로 ID 조회 - " + member);
				String email = member.getEmail();
				System.out.println(email);
				request.setAttribute("email", email);
				request.getRequestDispatcher("/member/findMemberResult.jsp").forward(request, response);

			}

		} catch (NullPointerException e) {
			String nullCheck = null;
			System.out.println("해당 내용으로 가입된 회원 없음!!");
			request.setAttribute("nullCheck", nullCheck);
			request.getRequestDispatcher("/member/findMemberResult.jsp").forward(request, response);
		}

	}

}
