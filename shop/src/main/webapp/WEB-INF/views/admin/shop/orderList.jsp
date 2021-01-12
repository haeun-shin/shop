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
<title>주문 목록</title>
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
			<section id="orderList">
				<h2>주문목록</h2>
				<table class="orderListTable">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문일자</th>
							<th>총 구매금액</th>
							<th>주소</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${orderList }" var="orderList">
					<tr>
						<td class="orderId"><a href="/admin/shop/orderView?n=${orderList.orderId }">${orderList.orderId }</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderList.orderDate }" /></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${orderList.amount }" />원</td>
						<td>(${orderList.userAddr1 }) ${orderList.userAddr2 } ${orderList.userAddr3 }</td>
						<td>${orderList.delivery }</td>
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