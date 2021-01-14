package com.shop.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.shop.mappers.memberMapper";
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}
	
	// 아이디 체크
	@Override
	public int idCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".idCheck", userId);
	}
	
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	// 회원정보 상세조회
	@Override
	public MemberVO viewMember(String userId) throws Exception {
		return sql.selectOne(namespace + ".viewMember", userId);
	}
	
	// 회원정보 수정
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sql.update(namespace + ".updateMember", vo);
	}
	
	// 비밀번호 확인
	@Override
	public String passCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".passCheck", userId);
	}
	
	// 회원 탈퇴
	@Override
	public void outMember(MemberVO vo) throws Exception {
		sql.delete(namespace + ".outMember", vo);
	}
}
