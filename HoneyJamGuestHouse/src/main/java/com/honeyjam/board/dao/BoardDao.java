package com.honeyjam.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Board;


public interface BoardDao {

	List<Board> selectItemsById(SqlSession session, String email);
	
	int insertBoard(SqlSession session, Board board);
	
	int updateBoardById(SqlSession session, Board newBoard);
	
	int deleteBoardById(SqlSession session, String email);
	
	List<Board>	selectAllItems(SqlSession session);
	
	List<Board> selectItemList(SqlSession session, int beginItemNum, int endItemNum);
	
	int selectItemCount(SqlSession session);
}
