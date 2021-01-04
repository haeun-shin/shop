package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	private AdminDAO dao;
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}
	
	// 상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}
	
	// 상품 목록
	@Override
	public List<GoodsVO> goodsList() throws Exception {
		return dao.goodsList();
	}
	
	// 상품 조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int goodsNum) throws Exception {
		return dao.goodsView(goodsNum);
	}
}