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
	private int goodsNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String goodsName;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
