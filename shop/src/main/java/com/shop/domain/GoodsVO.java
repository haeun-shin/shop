package com.shop.domain;

import java.util.Date;

public class GoodsVO {
/*
    goodsNum       	number          not null,
    goodsName      	varchar2(50)    not null,
    cateCode		varchar2(30)    not null,
    goodsPrice     	number          not null,
    goodsStock     	number          null,
    goodsDesc       varchar(500)    null,
    goodsImg       	varchar(200)    null,
    goodsDate      	date            default sysdate,
    goodsThumbImg	varchar(200)	null,
    primary key(goodsNum)  
*/
	private int goodsNum;
	private String goodsName;
	private String cateCode;
	private int goodsPrice;
	private int goodsStock;
	private String goodsDesc;
	private String goodsImg;
	private Date goodsDate;
	private String goodsThumbImg;
	
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public Date getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}
	public String getGoodsThumbImg() {
		return goodsThumbImg;
	}
	public void setGoodsThumbImg(String goodsThumbImg) {
		this.goodsThumbImg = goodsThumbImg;
	}
	
	
}
