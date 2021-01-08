package com.shop.domain;

import java.util.Date;

public class CartVO {
/*
	tbl_cart
    cartNum     number      not null,
    userId      varchar2(50)        not null,
    goodsNum        number      not null,
    cartStock       number      not null,
    addDate     date        default sysdate,
    primary key(cartNum, userId)
*/
	private int cartNum;	// 카트 고유 번호
	private String userId;	// 사용자 아이디 (tbl_member 참조)
	private int goodsNum;	// 상품 번호 (tbl_goods 참조)
	private int cartStock;	// 카트 수량
	private Date addDate;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}	
	
	
}
