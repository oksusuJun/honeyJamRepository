package com.honeyjam.board.service;

import java.util.List;

import com.honeyjam.vo.Board;

public interface BoardService {
	
	List<Board> getItemsById(String email);
	
	void insertBoard(Board board);
	
	void updateBoard(Board newBoard);
	
	void deleteBoard(String email);
	
	List<Board> selectAllItems();
	
	Board selectItemsByTitle(String title);
	
	Board selectItemByNum(int itemNum);

}
