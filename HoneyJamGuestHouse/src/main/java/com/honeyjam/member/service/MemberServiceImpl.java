package com.honeyjam.member.service;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.exception.DuplicatedIdException;
import com.honeyjam.exception.DuplicatedNicknameException;
import com.honeyjam.exception.DuplicatedPhoneException;
import com.honeyjam.exception.LoginFailException;
import com.honeyjam.member.dao.MemberDao;
import com.honeyjam.member.dao.MemberDaoImpl;
import com.honeyjam.util.SqlSessionFactoryManager;
import com.honeyjam.vo.Member;


public class MemberServiceImpl implements MemberService {

	private static MemberServiceImpl instance;

	private SqlSessionFactory factory;
	private MemberDao dao;

	private MemberServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = MemberDaoImpl.getInstance();
	}

	public static MemberServiceImpl getInstance() throws IOException{
		if (instance == null) {
			instance = new MemberServiceImpl();
		}
		return instance;
	}



	@Override
	public Member authenticate(String email, String password) throws LoginFailException {

		SqlSession session = null;

		try {
			session=factory.openSession();
			Member member = dao.selectMemberById(session, email); // 

			if(member!=null) {//있는 ID
				if(password.equals(member.getPassword())) {
					return member;					
				}else {
					throw new LoginFailException("패스워드를 확인하세요");
				}

			}else {//없는 ID
				throw new LoginFailException("없는 email 입니다.");
			}
			
			
		}finally {
			session.close();
		}
	}

		@Override
		public Member findMemberById(String email) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public void addMember(Member member) throws DuplicatedIdException, DuplicatedNicknameException, DuplicatedPhoneException {
			SqlSession session = null;
			try{
				//업무 흐름(Business Logic)
				session = factory.openSession();
				if(dao.selectMemberById(session, member.getEmail())!=null){//이미 있는 ID이면.
					throw new DuplicatedIdException("이미 등록된 이메일입니다.", member.getEmail());
				}else if(dao.selectMemberByNickname(session, member.getNickname())!=null) {
					throw new DuplicatedNicknameException("이미 등록된 닉네임 입니다.",member.getNickname());
				}else if(dao.selectMemberByPhone(session, member.getPhoneNum())!=null) {
					throw new DuplicatedPhoneException("중복된 전화번호 입니다.",member.getPhoneNum());
				}

				dao.insertMember(session, member);
				session.commit();
				
			}finally{
				session.close();
			}		


		}

		@Override
		public void updateMember(Member newData) {
			// TODO Auto-generated method stub

		}

		@Override
		public void removeMemberById(String email) {
			// TODO Auto-generated method stub

		}



	}
