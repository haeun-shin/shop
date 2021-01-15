package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.Criteria;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;
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
	public List<GoodsViewVO> goodsList() throws Exception {
		return dao.goodsList();
	}
	
	// 상품 조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int goodsNum) throws Exception {
		return dao.goodsView(goodsNum);
	}
	
	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}
	
	// 상품 삭제
	@Override
	public void goodsDelete(int goodsNum) throws Exception {
		dao.goodsDelete(goodsNum);
	}
	
	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}
	
	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}
	
	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		dao.changeStock(goods);
	}
	
	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}
	
	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int replyNum) throws Exception {
		dao.deleteReply(replyNum);
	}
	
	// 회원 목록 GET
//	@Override
//	public List<MemberVO> memberList() throws Exception {
//		return dao.memberList();
//	}
	
	// 회원 목록 GET + 페이징
	@Override
	public List<MemberVO> memberList(Criteria cri) throws Exception {
		return dao.memberList(cri);
	}
	// 총 회원 수
	@Override
	public int memberCount() throws Exception {
		return dao.memberCount();
	}
}
