package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.GoodsViewVO;
import com.shop.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{
	@Inject 
	private ShopDAO dao;
	
	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;
		
		// 1차 분류일 경우
		if(level == 1) {
			cateCodeRef = cateCode;
			
			return dao.list(cateCode, cateCodeRef);
		} else { // 2차 분류일 경우
			return dao.list(cateCode);
		}
		
	}
}
