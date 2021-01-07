package com.shop.domain;

import java.util.Date;

public class ReplyVO {
	/*
	tbl_reply
    goodsNum   number not null, (tbl_goods(goodsNum)참조)
    userId     varchar2(50)   not null, (tbl_member(userId)참조)
    replyNum   number         not null,
    replyCon   varchar2(2000) not null,
    replyDate  date           default sysdate,
    primary key(goodsNum, replyNum) 
	*/
	
	private int goodsNum;
	private String userId;
	private int replyNum;
	private String replyCon;
	private Date replyDate;
	
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getReplyCon() {
		return replyCon;
	}
	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
