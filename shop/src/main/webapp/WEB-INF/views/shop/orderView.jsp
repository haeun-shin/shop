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
				<table class="orderInfo">
					<tbody>
						<c:forEach items="${orderView }" var="orderView" varStatus="status">
						<c:if test="${status.first }">
							<tr>
								<td>수령인</td>
								<td>${orderView.orderRec }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>(${orderView.userAddr1 }) ${orderView.userAddr2 } ${orderView.userAddr3 }</td>
							</tr>
							<tr>
								<td>가격</td>
								<td><fmt:formatNumber pattern="###,###,###,###" value="${orderView.amount }" />원</td>
							</tr>
							<tr>
								<td>상태</td>
								<td>${orderView.delivery }</td>
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				<table class="orderView">
					<thead>
						<th>썸네일</th>
						<th>상품명</th>
						<th>판매가</th>
						<th>수량</th>
						<th>합계금액</th>
					</thead>
					<tbody>
						<c:forEach items="${orderView }" var="orderView">
						<tr>
							<td><img src="${orderView.goodsThumbImg }" /></td>
							<td>${orderView.goodsName }</td>
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