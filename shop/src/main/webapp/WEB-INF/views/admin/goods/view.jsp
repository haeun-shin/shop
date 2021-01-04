<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<form role="form" method="post" autocomplete="off">
				<div class="inputArea">
					<label>1차 분류</label>
					<span class="category1"></span>
					
					<label>2차 분류</label>
					<span class="category2">${goods.cateCode }</span>
				</div>
				
				<div class="inputArea">
					<label for="goodsName">상품명</label>
					<span>${goods.goodsName }</span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 가격</label>
					<span><fmt:formatNumber value="${goods.goodsPrice }" pattern="###,###,###" /></span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 수량</label>
					<span><fmt:formatNumber value="${goods.goodsStock }" pattern="###,###,###" /></span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 소개</label>
					<span>${goods.goodsDesc }</span>
				</div>
				<div class="inputArea">
					<button type="button" id="register_Btn">수정</button>
					<button type="button" id="delete_Btn">삭제</button>
				</div>
			</form>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>
</body>
</html>