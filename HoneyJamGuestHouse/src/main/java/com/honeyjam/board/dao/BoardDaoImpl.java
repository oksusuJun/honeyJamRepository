package com.honeyjam.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Board;

public class BoardDaoImpl implements BoardDao {
	
	private static BoardDaoImpl instance;

	private BoardDaoImpl() {

	}

	public static BoardDaoImpl getInstance() {
		if (instance == null)
			instance = new BoardDaoImpl();
		return instance;
	}
	
	private String makeSqlId(String id) {
		return "com.honeyjam.board.dao.mapper.BoardMapper."+id;
	}

	@Override
	public List<Board> selectItemsById(SqlSession session, String email) {
		
		return session.selectList(makeSqlId("selectItemsById"),email);
	}

	@Override
	public int insertBoard(SqlSession session, Board board) {
		return session.insert(makeSqlId("insertBoard"), board);
	}

	@Override
	public int updateBoardById(SqlSession session, Board newBoard) {
		return session.update(makeSqlId("updateBoardById"), newBoard);
	}

	@Override
	public int deleteBoardById(SqlSession session, String email) {
		return session.delete(makeSqlId("deleteBoardById"), email);
	}

	@Override
	public List<Board> selectAllItems(SqlSession session) {
		return session.selectList(makeSqlId("selectAllItems"));
	}

	@Override
	public List<Board> selectItemList(SqlSession session, int beginItemNum, int endItemNum) {
		
		HashMap<String,Integer> map = new HashMap<>();
		map.put("end", endItemNum);
		map.put("begin", beginItemNum);
		return session.selectList(makeSqlId("selectItemList"),map);
	}

	@Override
	public int selectItemCount(SqlSession session) {
		return session.selectOne(makeSqlId("selectItemCount"));
	}
	
	

	
}
