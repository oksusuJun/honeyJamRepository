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
			SqlSession session = null; 
			try {
				session = factory.openSession();
				return dao.selectMemberById(session, email);
			}finally {
				session.close();
			}
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
		public void updateMember(Member newData) throws DuplicatedNicknameException, DuplicatedPhoneException {
			SqlSession session = null;
			try {
				session = factory.openSession();
				Member oldData = dao.selectMemberById(session, newData.getEmail());
				if(dao.selectMemberByNickname(session, newData.getNickname()) != null) {
					if(!oldData.getNickname().equals(newData.getNickname())) {
						throw new DuplicatedNicknameException("이미 등록된 닉네임 입니다.", newData.getNickname());
					}
				}else if(dao.selectMemberByPhone(session, newData.getPhoneNum())!= null) {
					if(!oldData.getPhoneNum().equals(newData.getPhoneNum())) {
						throw new DuplicatedPhoneException("중복된 전화번호 입니다.",newData.getPhoneNum());
					}
				}
				dao.updateMemberById(session, newData);
				session.commit();
			}finally {
				session.close();
			}
		}

		@Override
		public void removeMemberById(String email) {
				SqlSession session = null;
				try {
					session=factory.openSession();
					dao.deleteMemberById(session, email);
					session.commit();
				}finally {
					session.close();
				}
		}

		@Override
		public Member findMemberByPhone(String phoneNum) {
			SqlSession session = null;
			try {
				session = factory.openSession();
				Member member = dao.selectMemberByPhone(session, phoneNum);
				return member;
			} finally {
				session.close();
			}
		}



	}
