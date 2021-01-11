<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>상품 목록</title>
</head>
<body>
<div id="root">
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<h2>회원 주문 확인</h2>
			<ul class="orderInfo">
				<c:forEach items="${orderView }" var="orderView" varStatus="status">
				<c:if test="${status.first }">
				<li>
					<div>
						<p><span>주문번호</span>${orderView.orderId }</p>
						<p><span>수령인</span>${orderView.userId }</p>
						<p><span>주소</span>(${orderView.userAddr1 }) ${orderView.userAddr2 } ${orderView.userAddr3 }</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount }"/>원</p>
					</div>
				</li>
				</c:if>
				</c:forEach>
			</ul>
			<ul class="orderView">
				<c:forEach items="${orderView }" var="orderView">
				<li>
					<div class="thumb">
						<img src="${orderView.goodsThumbImg }" />
					</div>
					<div class="goodsInfo">
						<p>
							<span>상품명</span>${orderVoew.goodsName }<br>
							<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice }" />원<br>
							<span>구입 수량</span>${orderView.cartStock } 개<br>
							<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice * orderView.cartStock}" />원<br>
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
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