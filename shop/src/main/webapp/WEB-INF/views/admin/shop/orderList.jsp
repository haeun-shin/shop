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
			<h2>주문 확인</h2>
			<ul class="orderList">
				<c:forEach items="${orderList }" var="orderList">
				<li>
					<div>
						<p><span>주문번호</span><a href="/admin/shop/orderView?n=${orderList.orderId }">${orderList.orderId }</a></p>
						<p><span>주문자</span>${orderList.userId }</p>
						<p><span>수령인</span>${orderList.userId }</p>
						<p><span>주소</span>(${orderList.userAddr1 }) ${orderList.userAddr2 } ${orderList.userAddr3 }</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount }"/>원</p>
						<p><span>상태</span>${orderList.delivery}</p>
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