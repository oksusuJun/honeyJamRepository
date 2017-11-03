package com.honeyjam.board.service;

import java.util.List;
import java.util.Map;

import com.honeyjam.vo.Board;

public interface BoardService {
	
	List<Board> getItemsById(String email);
	
	void insertBoard(Board board);
	
	void updateBoard(Board newBoard);
	
	void deleteBoard(String email);
	
	List<Board> selectAllItems();
	

	Map<String, Object> getItemList(int page);

	Board selectItemsByTitle(String title);
	
	Board selectItemByNum(int itemNum);

	void deleteBoardByNum(int itemNum);
}
