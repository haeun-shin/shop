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
<script src="/resources/js/jquery-3.3.1.min.js"></script>
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
			<section id="orderView">
				<h2>주문상세조회</h2>
				<table class="orderInfo">
					<div class="title"><h4>구매정보</h4></div>
					<tbody>
						<%-- 첫 번째 요소만 출력. 중복되는 부분이므로 모두 출력할 필요 없음.  --%>
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
								<td>
									<div class="deliveryChange">
										<p>${orderView.delivery }</p>
										<form role="form" method="post" class="deliveryForm">
											<input type="hidden" name="orderId" value="${orderView.orderId }" />
											<input type="hidden" name="delivery" class="delivery" value="" />
											
											<button type="button" class="delivery_btn_1">배송 준비</button>
											<button type="button" class="delivery_btn_2">배송 중</button>
											<button type="button" class="delivery_btn_3">배송 완료</button>
											
											<script>
												$(".delivery_btn_1").click(function() {
													$(".delivery").val("배송 준비");
													run();
												});
												$(".delivery_btn_2").click(function() {
													$(".delivery").val("배송 중");
													run();
												});
												$(".delivery_btn_3").click(function() {
													$(".delivery").val("배송 완료");
													run();
												});
												
												function run() {
													$(".deliveryForm").submit();
												}
											</script>
										</form>
									</div>
								</td>
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
							<td class="goodsName"><a href="/shop/view?n=${orderView.goodsNum }">${orderView.goodsName }</a></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice }" />원</td>
							<td>${orderView.cartStock }개</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice * orderView.cartStock}" />원</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		
	</section>
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
</body>
</html>