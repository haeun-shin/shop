package com.shop.domain;

import java.util.Date;

public class MemberVO {
/*	
    userId      varchar2(50)    not null,
    userPass    varchar2(100)   not null,
    userName    varchar2(30)    not null,
    userPhone    varchar2(20)    not null,
    userAddr1   varchar2(20)    null,
    userAddr2   varchar2(50)    null,
    userAddr3   varchar2(50)    null,
    regDate    date            default sysdate,
    verify      number          default 0,
    primary key(userId)
*/
//	private String userId;
//	private String userPass;
//	private String userName;
//	private String userPhone;
//	private String userAddr1;
//	private String userAddr2;
//	private String userAddr3;
//	private Date regDate;
//	private int verify;
//	
//	public String getUserId() {
//		return userId;
//	}
//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
//	public String getUserPass() {
//		return userPass;
//	}
//	public void setUserPass(String userPass) {
//		this.userPass = userPass;
//	}
//	public String getUserName() {
//		return userName;
//	}
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//	public String getUserPhone() {
//		return userPhone;
//	}
//	public void setUserPhone(String userPhone) {
//		this.userPhone = userPhone;
//	}
//	public String getUserAddr1() {
//		return userAddr1;
//	}
//	public void setUserAddr1(String userAddr1) {
//		this.userAddr1 = userAddr1;
//	}
//	public String getUserAddr2() {
//		return userAddr2;
//	}
//	public void setUserAddr2(String userAddr2) {
//		this.userAddr2 = userAddr2;
//	}
//	public String getUserAddr3() {
//		return userAddr3;
//	}
//	public void setUserAddr3(String userAddr3) {
//		this.userAddr3 = userAddr3;
//	}
//	public Date getRegDate() {
//		return regDate;
//	}
//	public void setRegDate(Date regDate) {
//		this.regDate = regDate;
//	}
//	public int getVerify() {
//		return verify;
//	}
//	public void setVerify(int verify) {
//		this.verify = verify;
//	}
/*	
	  userId VARCHAR2(50),
	  userPass VARCHAR2(100) NOT NULL,
	  userName VARCHAR2(30) NOT NULL,
	  userMail VARCHAR2(100) NOT NULL,
	  userAddr1 VARCHAR2(100) NOT NULL,
	  userAddr2 VARCHAR2(100) NOT NULL,
	  userAddr3 VARCHAR2(100) NOT NULL,
	  adminCk NUMBER NOT NULL,
	  regDate DATE NOT NULL,
	  money number NOT NULL,
	  point number NOT NULL,
	  PRIMARY KEY(userId)
*/
	private String userId;		// 회원 ID
	private String userPass;	// 회원 비밀번호
	private String userName;	// 회원 이름
	private String userMail;	// 회원 이메일
	private String userAddr1;	// 회원 우편번호
	private String userAddr2;	// 회원 주소
	private String userAddr3;	// 회원 상세주소
	private String userPhone;	// 회원 전화번호
	private int adminCk;		// 관리자 구분(0:일반사용자, 1:관리자)
	private Date regDate;		// 가입일
	private int money;			// 회원 돈
	private int point;			// 회원 포인트
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userMail="
				+ userMail + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3
				+ ", userPhone=" + userPhone + ", adminCk=" + adminCk + ", regDate=" + regDate + ", money=" + money
				+ ", point=" + point + "]";
	}
	
	

	
	
}
