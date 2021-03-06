package com.honeyjam.board.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.board.service.BoardService;
import com.honeyjam.board.service.BoardServiceImpl;
import com.honeyjam.vo.Board;
import com.honeyjam.vo.Member;


@WebServlet("/boardSelect")
public class BoardSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		Member member=(Member)session.getAttribute("loginMember");
		if(member==null) {
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		}
		
		BoardService service=BoardServiceImpl.getInstance();
		List<Board> list = service.getItemsById(member.getEmail());
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/member/myboard.jsp").forward(request, response);
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
