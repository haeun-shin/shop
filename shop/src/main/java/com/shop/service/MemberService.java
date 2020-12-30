package com.shop.service;

import com.shop.domain.MemberVO;

public interface MemberService {
	// 회원가입
	public void signup(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
}
