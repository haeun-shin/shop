<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<meta charset="UTF-8">
<title>주문 상세</title>
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
			<section id="orderView">
				<h2>주문상세조회</h2>
				<table class="orderInfo">
					<div class="title"><h4>구매정보</h4></div>
					<tbody>
						<c:forEach items="${orderView }" var="orderView" varStatus="status">
						<c:if test="${status.first }">
							<tr>
								<th>수령인</th>
								<td>${orderView.orderRec }</td>
								<th>주소</th>
								<td>(${orderView.userAddr1 }) ${orderView.userAddr2 } ${orderView.userAddr3 }</td>
							</tr>
							<tr>
								<th>총 주문 금액</th>
								<td><fmt:formatNumber pattern="###,###,###,###" value="${orderView.amount }" />원</td>
								<th>상태</th>
								<td>${orderView.delivery }</td>
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				<table class="orderView">
					<div class="title"><h4>주문상품정보</h4></div>
					<colgroup>
						<col width="125px">
						<col width="400px">
						<col width="188px">
						<col width="125px">
						<col width="px">
					</colgroup>
					<thead>
						<tr>
							<th>썸네일</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>수량</th>
							<th>합계금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderView }" var="orderView">
						<tr>
							<td><img src="${orderView.goodsThumbImg }" /></td>
							<td class="goodsName"><a href="/market/view?n=${orderView.goodsNum }">${orderView.goodsName }</a></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice }" />원</td>
							<td>${orderView.cartStock }개</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice * orderView.cartStock}" />원</td>
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