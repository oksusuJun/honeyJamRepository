package com.honeyjam.board.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.board.dao.BoardDao;
import com.honeyjam.board.dao.BoardDaoImpl;
import com.honeyjam.util.SqlSessionFactoryManager;
import com.honeyjam.vo.Board;

public class BoardServiceImpl implements BoardService {
	
	private static BoardServiceImpl instance;
	
	private SqlSessionFactory factory;
	private BoardDao boardDao;

	private BoardServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		boardDao=BoardDaoImpl.getInstance();
	}

	public static BoardServiceImpl getInstance() throws IOException {
		if (instance == null)
			instance = new BoardServiceImpl();
		return instance;
	}
	
	

	@Override
	public List<Board> getItemsById(String email) {
		
		SqlSession session = null;
		try {
			session=factory.openSession();
			return boardDao.selectItemsById(session, email);
			
		}finally {
			session.close();
		}
		
	}

	@Override
	public void insertBoard(Board board) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			boardDao.insertBoard(session, board);
			session.commit();
		}finally {
			session.close();
		}
	}

	@Override
	public void updateBoard(Board newBoard) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			boardDao.updateBoardById(session, newBoard);
			session.commit();
		}finally {
			session.close();
		}
	}

	@Override
	public void deleteBoard(String email) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			boardDao.deleteBoardById(session, email);
			session.commit();
		}finally {
			session.close();
		}
	}
	

	
}
