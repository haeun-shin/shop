package com.shop.service;

import java.util.List;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;

public interface AdminService {
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품 등록
	public void register(GoodsVO vo) throws Exception;
	
	// 상품 목록
	public List<GoodsVO> goodsList() throws Exception;
	
	// 상품 조회 + 카테고리 조인
	public GoodsViewVO goodsView(int goodsNum) throws Exception;
}
