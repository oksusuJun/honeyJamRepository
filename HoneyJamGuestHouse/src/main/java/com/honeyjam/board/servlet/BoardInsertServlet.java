package com.honeyjam.board.servlet;

import java.io.IOException;
import java.util.Date;

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

/**
 * Servlet implementation class BoardInsertServlet
 */
/**
 * 리뷰게시판에 글 올리면 DB에 저장하는 서블릿
 * @author Administrator
 *
 */
@WebServlet("/boardInsert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardService service= BoardServiceImpl.getInstance();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		service.insertBoard(new Board(1,request.getParameter("content"),request.getParameter("title"),new Date(),member.getEmail()));
		response.sendRedirect("/HoneyJamGuestHouse/board/ContentView.jsp");
		
	}

}
