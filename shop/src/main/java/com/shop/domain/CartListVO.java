package com.shop.domain;

import java.util.Date;

public class CartListVO {
/*
	tbl_cart
    cartNum     number      not null,
    userId      varchar2(50)        not null,
    goodsNum        number      not null,
    cartStock       number      not null,
    addDate     date        default sysdate,
    primary key(cartNum, userId)
*/
	private int cartNum;
	private String userId;
	private int goodsNu;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String goodsNum;
	private int goodsPrice;
	private String goodsThumbImg;
	
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
	public int getGoodsNu() {
		return goodsNu;
	}
	public void setGoodsNu(int goodsNu) {
		this.goodsNu = goodsNu;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsThumbImg() {
		return goodsThumbImg;
	}
	public void setGoodsThumbImg(String goodsThumbImg) {
		this.goodsThumbImg = goodsThumbImg;
	}
	
	
}
