package com.shop.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.shop.mappers.adminMapper";
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}
	
	// 상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}
	
	// 상품 목록
	@Override
	public List<GoodsViewVO> goodsList() throws Exception {
		return sql.selectList(namespace + ".goodsList");
	}
	
	// 상품 조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int goodsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", goodsNum);
	}
	
	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);
	}
	
	// 상품 삭제
	@Override
	public void goodsDelete(int goodsNum) throws Exception {
		sql.delete(namespace + ".goodsDelete", goodsNum);
	}
}
