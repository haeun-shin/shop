package com.shop.service;

import java.util.List;

import com.shop.domain.GoodsViewVO;

public interface ShopService {
	// 카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	// 상품 조회
	public GoodsViewVO goodsView(int goodsNum) throws Exception;
	
}
