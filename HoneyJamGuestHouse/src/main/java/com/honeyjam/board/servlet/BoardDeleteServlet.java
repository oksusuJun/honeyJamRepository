package com.honeyjam.board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.board.service.BoardService;
import com.honeyjam.board.service.BoardServiceImpl;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String num2 = request.getParameter("itemNum");
		int num = Integer.parseInt(num2);
		System.out.println("삭제할 게시물 번호 : "+num);
		
		BoardService service = BoardServiceImpl.getInstance();
		service.deleteBoardByNum(num);
		
		response.sendRedirect("/HoneyJamGuestHouse/member/admin.jsp");
		
	}

}
