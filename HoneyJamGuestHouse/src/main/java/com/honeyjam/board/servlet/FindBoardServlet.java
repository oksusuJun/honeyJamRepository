package com.honeyjam.board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.board.service.BoardService;
import com.honeyjam.board.service.BoardServiceImpl;
import com.honeyjam.vo.Board;

/**
 * Servlet implementation class FindBoardServlet
 */
@WebServlet("/findBoard")
public class FindBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * 메인 - 리뷰게시판 - 게시글 중 하나의 제목 클릭하면 - 해당 게시물을 볼 수 있도록 DB에 저장되어있는 게시물을 찾는 서블릿.
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//요청파라미터 조회
		String itemNum2 = request.getParameter("item");
		int itemNum = Integer.parseInt(itemNum2);
		
		BoardService service = BoardServiceImpl.getInstance();
		Board board = service.selectItemByNum(itemNum);
		request.setAttribute("item", board);
		
		request.getRequestDispatcher("/board/see_content_by_title.jsp").forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	
}
