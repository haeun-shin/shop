package com.shop.domain;

public class CategoryVO {
/*
	cateName     varchar2(20)    not null,
	cateCode     varchar2(30)    not null,
	cateCodeRef  varchar2(30)    null,
	primary key(cateCode),
	foreign key(cateCodeRef) references goods_category(cateCode)
*/
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
	
}
