package com.shop.persistence;

import com.shop.domain.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void signup(MemberVO vo) throws Exception;
	
	// 아이디 체크
	public int idCheck(String userId) throws Exception;
	
	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
}
