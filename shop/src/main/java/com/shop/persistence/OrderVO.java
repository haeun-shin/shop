package com.shop.persistence;

import java.util.Date;

public class OrderVO {
/*
	tbl_order
    orderId     varchar2(50) not null,
    userId      varchar2(50) not null,
    orderRec    varchar2(50) not null,
    userAddr1   varchar2(20) not null,
    userAddr2   varchar2(50) not null,
    userAddr3   varchar2(50) not null,
    orderPhone  varchar2(30) not null,
    amount      number       not null,
    orderDate   Date         default sysdate,   
    primary key(orderId) 
*/
	private String orderId;		// 주문 고유번호
	private String userId;		// 사용자
	private String orderRec;	// 수신자
	private String userAddr1;	// 주소 : 우편번호
	private String userAddr2;	// 주소 : 기본주소
	private String userAddr3;	// 주소 : 상세주소
	private String orderPhone;	// 연락처
	private int amount;			// 총 가격
	private Date orderDate;		// 주문 날짜
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
