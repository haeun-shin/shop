package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
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
			//return dao.list(cateCode);
			return dao.list(cateCode, cateCodeRef);

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
	
	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int replyNum) throws Exception {
		return dao.idCheck(replyNum);
	}
	
	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}
	
	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	// 주문 상세 정보
	@Override
	public void orderInfoDetails(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfoDetails(orderDetail);
	}
	
	// 주문 후, 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
	
	// 특정 유저 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
}
