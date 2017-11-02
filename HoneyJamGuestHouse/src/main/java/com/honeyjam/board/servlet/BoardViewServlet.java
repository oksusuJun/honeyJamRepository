package com.honeyjam.board.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.board.service.BoardService;
import com.honeyjam.board.service.BoardServiceImpl;
import com.honeyjam.vo.Board;


@WebServlet("/BoardViewServlet")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardService service = BoardServiceImpl.getInstance();
		List<Board> list = service.selectAllItems();
		request.setAttribute("itemList", list);
		request.getRequestDispatcher("/board/ContentView.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
