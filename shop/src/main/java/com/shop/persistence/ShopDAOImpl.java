package com.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO{
	@Inject
	private SqlSession sql;
	
	// Mapper
	private static String namespace = "com.shop.mappers.shopMapper";
	
	// 카테고리별 상품 리스트 : 2차 분류
//	@Override
//	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("cateCode", cateCode);
//		map.put("cateCodeRef", cateCodeRef);
//		
//		return sql.selectList(namespace + ".list_1", map);
//	}
	
	// 카테고리별 상품 리스트 : 1차 분류
//	@Override
//	public List<GoodsViewVO> list(int cateCode) throws Exception {
//		return sql.selectList(namespace + ".list_2", cateCode);
//	}
	
	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(namespace + ".list", map);
	}
	
	
	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int goodsNum) throws Exception {
		return sql.selectOne("com.shop.mappers.adminMapper" + ".goodsView", goodsNum);
	}
	
	// 상품 소감 작성
	@Override
	public void regitReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registReply", reply);
	}
	
	// 상품 소감 리스트
	@Override
	public List<ReplyListVO> replyList(int goodsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", goodsNum);
	}
	
	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int replyNum) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", replyNum);
	}
	
	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
	}
	
	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}
	
	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}
	
	// 주문 상세 정보
	@Override
	public void orderInfoDetails(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfoDetails", orderDetail);
	}
}
