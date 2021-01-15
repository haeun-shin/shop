package com.shop.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReplyListVO;

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
	
	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderAllList");
	}
	
	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderMemberView", order);
	}
	
	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}
	
	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sql.update(namespace + ".changeStock", goods);
	}
	
	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return sql.selectList(namespace + ".allReply");
	}
	
	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int replyNum) throws Exception {
		sql.delete(namespace + ".deleteReply", replyNum);
	}
	
	// 회원 목록 GET
	@Override
	public List<MemberVO> memberList() throws Exception {
		return sql.selectList(namespace + ".memberList");
	}
}
