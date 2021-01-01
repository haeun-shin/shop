package com.shop.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;

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
}
