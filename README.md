테이블
--
* tbl_member (회원관리)
  
| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|USERID|        VARCHAR2(50 BYTE)|      No|      |   아이디|
|USERPASS|	    VARCHAR2(100 BYTE)|	    No|      |   비밀번호|
|USERNAME|	    VARCHAR2(30 BYTE)|	    No|      |   이름|
|USERPHONE|	    VARCHAR2(20 BYTE)|	    No|		 |   연락처|
|USERADDR1|	    VARCHAR2(100 BYTE)|	    Yes|	 |   우편번호|
|USERADDR2|	    VARCHAR2(100 BYTE)|	    Yes|	 |   주소|
|USERADDR3|	    VARCHAR2(100 BYTE)|	    Yes|	 |   상세주소|
|REGDATE|	    DATE|	                Yes|	sysdate|가입일|
|USERMAIL|	    VARCHAR2(100 BYTE)|	    No|		 |   이메일|
|ADMINCK|	    NUMBER|	                No|		 |   관리자구분(0:사용자, 1:관리자)| 
|MONEY|	        NUMBER|	                No|	     |   돈|
|POINT|	        NUMBER|	                No|	     |   포인트|
|UPDATEDATE|    DATE|	                Yes|	sysdate|회원정보수정일|
|STATUS|	    VARCHAR2(50 BYTE)|	    No|	    'Y'|    가입상태(Y:가입, N:탈퇴)
|DROPDATE|	    DATE|	                Yes|	 |   탈퇴일

* tbl_goods (상품)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|GOODSNUM	    |NUMBER	            |No     |       |상품 아이디 
|GOODSNAME	    |VARCHAR2(150 BYTE)	|No     |       |상품 이름
|CATECODE	    |VARCHAR2(30 BYTE)	|No     |       |카테고리 코드
|GOODSPRICE	    |NUMBER	            |No     |       |가격
|GOODSSTOCK	    |NUMBER	            |Yes    |       |재고
|GOODSDESC	    |VARCHAR2(2000 BYTE)|Yes    |       |상품 설명
|GOODSIMG	    |VARCHAR2(200 BYTE)	|Yes    |       |상품 이미지
|GOODSDATE	    |DATE	            |Yes    |sysdate|상품 등록일
|GOODSTHUMBIMG	|VARCHAR2(200 BYTE)	|Yes    |       |썸네일 이미지