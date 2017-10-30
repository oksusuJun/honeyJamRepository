package com.honeyjam.member.service;

import com.honeyjam.exception.DuplicatedIdException;
import com.honeyjam.exception.DuplicatedNicknameException;
import com.honeyjam.exception.DuplicatedPhoneException;
import com.honeyjam.exception.LoginFailException;
import com.honeyjam.vo.Member;

public interface MemberService {
	
	Member authenticate(String email, String password) throws LoginFailException;
	
	Member findMemberById(String email);
	
	void addMember(Member member) throws DuplicatedIdException, DuplicatedNicknameException, DuplicatedPhoneException;
	
	void updateMember(Member newData);
	
	void removeMemberById(String email);

}
