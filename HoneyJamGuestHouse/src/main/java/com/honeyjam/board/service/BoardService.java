package com.honeyjam.board.service;

import java.util.List;

import com.honeyjam.vo.Board;

public interface BoardService {
	
	List<Board> getItemsById(String email);

}
