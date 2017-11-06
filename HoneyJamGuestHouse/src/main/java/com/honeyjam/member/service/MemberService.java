package com.honeyjam.member.service;


import com.honeyjam.exception.DuplicatedIdException;
import com.honeyjam.exception.DuplicatedNicknameException;
import com.honeyjam.exception.DuplicatedPhoneException;
import com.honeyjam.exception.LoginFailException;
import com.honeyjam.vo.Member;

public interface MemberService {
	
	Member authenticate(String email, String password) throws LoginFailException;
	
	Member findMemberById(String email);
	
	Member findMemberNickname(String nickname);
	
	void addMember(Member member) throws DuplicatedIdException, DuplicatedNicknameException, DuplicatedPhoneException;
	
	void updateMember(Member newData) throws DuplicatedNicknameException, DuplicatedPhoneException;
	
	void removeMemberById(String email);
	
	Member findMemberByPhone(String phoneNum);
	
	Member findMemberByIdnPhone(String email, String phoneNum);

}
