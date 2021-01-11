package com.shop.domain;

public class OrderDetailVO {
/*
	tbl_order_details
    orderDetailsNum number       not null,
    orderId         varchar2(50) not null,
    goodsNum          number          not null,
    cartStock       number          not null,
    primary key(orderDetailsNum)
*/
	private int orderDetailsNum;	// 주문 상세 번호(sequence)
	private String orderId;			// 주문 번호
	private int goodsNum;			// 상품 아이디
	private int cartStock;			// 카트 번호
	private String userId;			// 주문자 아이디
	
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
