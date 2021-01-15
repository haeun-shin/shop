package com.shop.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.shop.domain.MemberVO;
import com.shop.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	private MemberDAO dao;
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}
	
	// 아이디 체크
	@Override
	public int idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}
	
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}
	
	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	// 회원정보 상세조회
	@Override
	public MemberVO viewMember(String userId) throws Exception {
		return dao.viewMember(userId);
	}
	
	// 회원정보 수정
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);
	}
	
	// 비밀번호 확인
	@Override
	public String passCheck(String userId) throws Exception {
		return dao.passCheck(userId);
	}
	
	// 회원 탈퇴 : delete
	@Override
	public void outMember(MemberVO vo) throws Exception {
		dao.outMember(vo);
	}
}
