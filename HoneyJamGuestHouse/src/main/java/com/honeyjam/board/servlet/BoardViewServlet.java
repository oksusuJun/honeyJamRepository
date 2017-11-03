package com.honeyjam.board.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

		doPost(request,response);
/*		BoardService service = BoardServiceImpl.getInstance();
		List<Board> list = service.selectAllItems();

		request.setAttribute("itemList", list);
		request.getRequestDispatcher("/board/ContentView.jsp").forward(request, response);*/

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청파라미터 조회 - 보여줄 페이지
		int page = 1;  // default 페이지 (잘못된 페이지가 넘겨오면) 를 첫번째 페이지로 보여주겠다는 것. 

		try {
			page=Integer.parseInt(request.getParameter("page"));

		}catch(NumberFormatException e) {

		}
		//2. 비지니스로직 : ItemService.getItemList(page) 호출

		BoardService service = BoardServiceImpl.getInstance();
		Map<String,Object> map = service.getItemList(page);
		System.out.println(map.get("list"));

		//3. 응답 처리 : ContentView.jsp로 이동 - 요청디스패치

		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageBean", map.get("pageBean"));
		request.getRequestDispatcher("/board/ContentView.jsp").forward(request, response);


	}

}
