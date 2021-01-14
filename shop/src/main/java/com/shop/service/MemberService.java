package com.shop.service;

import javax.servlet.http.HttpSession;

import com.shop.domain.MemberVO;

public interface MemberService {
	// 회원가입
	public void signup(MemberVO vo) throws Exception;
	
	// 아이디 체크
	public int idCheck(String userId) throws Exception;
	
	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 로그아웃
	public void signout(HttpSession session) throws Exception;
	
	// 회원정보 상세조회
	public MemberVO viewMember(String userId) throws Exception;
	
	// 회원정보 수정
	public void updateMember(MemberVO vo) throws Exception;
	
	// 비밀번호 확인
	public String passCheck(String userId) throws Exception;
	
	// 회원 탈퇴
	public void outMember(MemberVO vo) throws Exception;
}
