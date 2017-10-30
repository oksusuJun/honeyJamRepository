package com.honeyjam.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Member;



public interface MemberDao {
	
	int insertMember(SqlSession session, Member member);
	
	int updateMemberById(SqlSession session, Member member);
	
	int deleteMemberById(SqlSession session, String email);
	
	Member selectMemberById(SqlSession session, String email);
	
	Member selectMemberByNickname(SqlSession session, String nickname);
	
	Member selectMemberByPhone(SqlSession session, String phoneNum);
}
