package com.shop.service;

import java.util.List;

import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopService {
	// 카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	// 상품 조회
	public GoodsViewVO goodsView(int goodsNum) throws Exception;
	
	// 상품 소감 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	// 상품 소감 리스트
	public List<ReplyListVO> replyList(int goodsNum) throws Exception;
	
	// 상품 소감(댓글) 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	// 아이디 체크
	public String idCheck(int replyNum) throws Exception;

	// 상품 소감(댓글) 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	// 카트 담기
	public void addCart(CartVO cart) throws Exception;
}
