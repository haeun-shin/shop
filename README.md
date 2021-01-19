<div style="font-size:0.85rem;">

## ___INTRO___
### 소개
<br/>

* 관리자 계정 접속
  * ID : haeun
  * PASSWORD : 1234
  * ![ADMIN 접속 방법](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcyUSWI%2FbtqT0tAG3aW%2F90d6TDkOM971aleXRiGO2k%2Fimg.png)
* 커밋 내역
  * <https://github.com/haeun-shin/shop/commits>


<br/><br/>

---

<br/><br/>

## ___USEED___
### 개발 시 사용한 기능
<br/>

* CKEditor를 이용한 상품 등록
* ajax를 이용한 비동기 데이터 처리




<br/><br/>

---

<br/><br/>

## ___FUNCTION___
### 사용한 기능
<br/>

__1. ADMIN__
   * 상품 등록
   * 상품 조회 (목록, 상세)
   * 상품 수정
   * 상품 삭제
   * 주문 목록 조회 (목록, 상세)
      * 배송상태 변경
   * 댓글 조회 (목록)
      * 댓글 삭제
   * 회원 조회 (목록)

<br/>

__2. MEMBER__
   * 회원가입 (Ajax로 아이디 중복 체크)
   * 로그인
   * 회원 정보 조회
   * 회원 정보 수정
   * 회원 탈퇴

<br/>

__3. SHOP__
   * 카테고리별 상품 조회 (목록)
      * 상품 상세 조회
      * 상품 댓글 작성 (ajax)
      * 상품 댓글 수정
      * 상품 댓글 삭제
   * 장바구니 담기
   * 장바구니 조회
       * 장바구니 상품 삭제 (전체, 체크)
       * 상품 주문
   * 주문 목록 조회 (목록, 상세)
       * 주문 취소 

<br/><br/>

---

<br/><br/>

## ___ADD___
### 추가할 기능
<br/>

- ~~__주문 취소__~~ (2021.01.18 완료)
  - ~~jsp : '주문 완료' 상태일 때만, [주문 취소] 버튼 생성.~~
  - ~~sql~~
      ```sql
      where delivery = '주문 완료' and orderId = #{}
      ```
- __주문 정보 수정__
  - jsp : '주문 완료' 상태일 때만, [주문 정보 수정] 버튼 생성.
  - sql : 필요한 항목만 `<include>` 해서 삽입될 수 있도록 하기.
      ```sql
         update tbl_order set userAddr1 = 00000 ...
         where delivery = '주문 완료' and orderId = #{}
      ```
- ~~__선택한 상품만 주문__~~ (21.01.19 완료)
  - ~~jsp : 체크된 상품만 amount 값 생성~~
  - ~~controller : null이 아닐 경우에만 반복시켜 리스트에 넣고  tbl_order_details sql 실행~~
    ```java 
    @RequestParam("카트번호") int[] 카트번호
    ``` 
  - ~~SQL : for문으로 들어오는 cartNum을 조회해서 insert~~ 
      ```sql
      insert into tbl_order_details(  orderDetailsNum, orderId, goodsNum, cartStock, userId)
      select	tbl_order_details_seq.nextval, #{orderId}, goodsNum, cartStock, #{userId}
      from	tbl_cart
      where	userId = #{userId}
      and   cartNum = #{cartNum}
      ```
- ~~__아이디 조건 추가__~~ (2021.01.18 완료)
  - ~~4자 이상 12자 이하 영문으로 시작, 숫자포함~~
- __답글형 문의 게시판__
  - 관리자만 답글 달 수 있게하기.


<br/><br/>

---

<br/><br/>

## ___TABLE___
### 테이블 관리
<br />

* __tbl_member__ (회원관리)
  
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

<br />

* __tbl_goods__ (상품)

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

<br />

* __goods_category__ (상품 카테고리)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|CATENAME	    |VARCHAR2(50 BYTE)	|No     |       |카테고리 이름
|CATECODE	    |VARCHAR2(30 BYTE)	|No     |       |카테고리 코드
|CATECODEREF	|VARCHAR2(30 BYTE)	|Yes    |       |카테고리 참조 코드

<br />

* __tbl_cart__ (장바구니)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|CARTNUM	|NUMBER	            |No     |       |카트 아이디
|USERID	    |VARCHAR2(50 BYTE)	|No     |       |사용자 아이디
|GOODSNUM	|NUMBER	            |No     |       |상품 아이디
|CARTSTOCK	|NUMBER	            |No     |       |장바구니 수량
|ADDDATE	|DATE	            |Yes    |sysdate|장바구니 생성일

<br />

* __tbl_order__ (주문 정보)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|ORDERID	    |VARCHAR2(50 BYTE)	|No     |       |주문 아이디
|USERID	        |VARCHAR2(50 BYTE)	|No     |       |사용자 아이디
|ORDERREC	    |VARCHAR2(50 BYTE)	|No     |       |받는 사람
|USERADDR1	    |VARCHAR2(100 BYTE)	|No     |       |우편번호
|USERADDR2	    |VARCHAR2(100 BYTE)	|No     |       |주소
|USERADDR3	    |VARCHAR2(100 BYTE)	|No     |       |상세주소
|ORDERPHONE	    |VARCHAR2(30 BYTE)	|No     |       |연락처
|AMOUNT	        |NUMBER	            |No     |       |합계금액
|ORDERDATE	    |DATE	            |Yes    |sysdate|주문일
|DELIVERY	    |VARCHAR2(20 BYTE)	|Yes    |'주문완료'|배송상태
|CANCELDATE     |DATE               |Yes    |         |주문취소일

<br />

* __tbl_order_details__ (주문 상세 정보)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|ORDERDETAILSNUM	|NUMBER	            |No     |       |상세주문 아이디
|ORDERID	        |VARCHAR2(50 BYTE)	|No     |       |주문 아이디
|GOODSNUM	        |NUMBER	            |No     |       |상품 아이디
|CARTSTOCK	        |NUMBER	            |No     |       |장바구니 아이디
|USERID	            |VARCHAR2(50 BYTE)	|No     |       |사용자 아이디

<br />

* __tbl_reply__ (댓글, 리뷰)

| column_name | data_type    | nullablet | data_defaul | memo   |
| ----------  | ---------    | :------: | :----------: | ---    |
|GOODSNUM	    |NUMBER	            |No     |       |상품 아이디
|USERID	        |VARCHAR2(50 BYTE)	|No     |       |사용자 아이디
|REPLYNUM	    |NUMBER	            |No     |       |댓글 아이디
|REPLYCON	    |VARCHAR2(2000 BYTE)|No     |       |댓글 내용
|REPLYDATE	    |DATE	            |Yes    |       |댓글 작성일


<br /><br />

</div>


