package com.honeyjam.board.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.board.dao.BoardDao;
import com.honeyjam.board.dao.BoardDaoImpl;
import com.honeyjam.board.util.PagingBean;
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

	@Override
	public List<Board> selectAllItems() {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return boardDao.selectAllItems(session);
		}finally {
			session.close();
		}
	}

	@Override
	public Map<String, Object> getItemList(int page) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<>();
		//list<Board>, PagingBean객체를 넘겨줄거다. 
		
		try {
			
			//PagingBean 생성 
			PagingBean pb = new PagingBean(boardDao.selectItemCount(session), page);
			
			map.put("pageBean",pb);
			
			List<Board> list = boardDao.selectItemList(session, pb.getBeginItemInPage(), pb.getEndItemInPage());
			map.put("list",list);
			
			return map;
		}finally {
			session.close();
			
		}
	}
	
	
	public Board selectItemsByTitle(String title) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return boardDao.selectItemsByTitle(session, title);
		}finally {
			session.close();
		}
	}

	@Override
	public Board selectItemByNum(int itemNum) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return boardDao.selectItemByNum(session, itemNum);
		}finally {
			session.close();
		}
	}

	@Override
	public void deleteBoardByNum(int itemNum) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			boardDao.deleteBoardByNum(session, itemNum);
			session.commit();
		}finally {
			session.close();
		}
		
	}
	
	
	

	
}
