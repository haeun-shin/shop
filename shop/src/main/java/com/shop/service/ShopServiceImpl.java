package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;
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
	
	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int goodsNum) throws Exception {
		return dao.goodsView(goodsNum);
	}
	
	// 상품 소감 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.regitReply(reply);
	}
	
	// 상품 소감 리스트
	@Override
	public List<ReplyListVO> replyList(int goodsNum) throws Exception {
		return dao.replyList(goodsNum);
	}
	
}
