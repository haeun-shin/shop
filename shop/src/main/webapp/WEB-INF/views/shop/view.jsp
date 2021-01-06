<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<title>Shop</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	
	<%-- 구매 수량 스크립트 START --%>
	// 수량 증가
	$(".plus").click(function() {
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		
		if(plusNum >= ${view.goodsStock}) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);
		}
	});
	
	// 수랑 감소
	$(".minus").click(function() {
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1;
		
		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);
		}
	});
	<%-- 구매 수량 스크립트 END --%>
	
});
</script>
<style>

</style>
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
		<aside>
			
		</aside>
		<div id="container_box">
			<h2>상품 조회</h2>
			
			<form role="form" method="post">
				<%-- 장바구니 추가, 리뷰 기능을 위한 hidden --%>
				<input type="hidden" name="goodsNum" value="${view.goodsNum }" />
			</form>
			
			<div class="goods">
				<div class="goodsImg">
					<img src="${view.goodsImg }" />
				</div>
				<div class="goodsInfo">
					<p class="goodsName">
						<span>상품명</span>
						${view.goodsName }
					</p>
					<p class="cateName">
						<span>카테고리</span>
						${view.cateName }
					</p>
					<p class="goodsPrice">
						<span>가격</span>
						<fmt:formatNumber pattern="###,###,###" value="${view.goodsPrice }" /> 원
					</p>
					<p class="goodsStock">
						<span>재고</span>
						<fmt:formatNumber pattern="###,###,###" value="${view.goodsStock }" /> EA
					</p>
					<p class="cartStock">
						<span>구입 수량</span>
						<button type="button" class="minus">-</button>
						<input type="number" class="numBox" min="1" max="${view.goodsStock }" value="1" readonly/>
						<button type="button" class="plus">+</button>
					</p>
					<p class="addToCart">
						<button type="button">카트에 담기</button>
					</p>
				</div>
				
				<div class="goodsDesc" >
					${view.goodsDesc }
				</div>
			</div>
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
