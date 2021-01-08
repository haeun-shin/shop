<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
</head>
<body>
<div id="root">
	<div id="header">
		<%-- 로그인, 회원가입 --%>
		<div class="top_nav">
			<%@ include file="../include/nav.jsp" %>
		</div>	
		<%-- 카테고리 --%>
		<div class="header">
			<%@ include file="../include/gnb.jsp" %>
		</div>
	</div>
	<section id="container">
		<div id="container_box">
			<section id="cartList">
				<table>
					<colgroup>
						<col width="62px">
						<col width="125px">
						<col width="377px">
						<col width="125px">
						<col width="126px">
						<col width="188px">
						<col width="127px">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"/></th>
							<th>상품 사진</th>
							<th>상품 이름</th>
							<th>판매 가격</th>
							<th>수량</th>
							<th>주문 금액</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList }" var="cartList">
						<tr class="cartInfo">
							<td><input type="checkbox" name="ckBox" class="ckBox" /></td>
							<td><img src="${cartList.goodsThumbImg }" /></td>
							<td class="cartGoodsName"><a href="/shop/view?n=${cartList.goodsNum }">${cartList.goodsName }</a></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${cartList.goodsPrice }"/> 원</td>
							<td>${cartList.cartStock } 개</td>
							<td><fmt:formatNumber pattern="###,###,###,###" value="${cartList.goodsPrice * cartList.cartStock }" /> 원</td>
							<td><button type="button" class="delete_btn">삭제</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
	</section>
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
</body>
</html>