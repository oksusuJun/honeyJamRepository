package com.honeyjam.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Board;

public interface BoardDao {

	List<Board> selectItemsById(SqlSession session, String email);
	
}
