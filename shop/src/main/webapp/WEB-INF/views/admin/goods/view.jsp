<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>상품 조회</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$("#modify_Btn").click(function() {
			formObj.attr("action", "/admin/goods/modify");
			formObj.attr("method", "get");
			formObj.submit();
		}); // #modify_Btn.click
		
		$("#delete_Btn").click(function() {
			
			var con = confirm("[ 상품명 : ${goods.goodsName } ]을/를 정말로 삭제하시겠습니까?");
			
			if(con) {
				formObj.attr("action", "/admin/goods/delete");
				formObj.submit();
			}
		}); // #delete_Btn.click
	})
</script>
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
		<div id="container_box" class="view_box">
			<h2 style="text-align:center;">상품 조회</h2>
			<hr style="margin-bottom: 2em;"/>
			<form role="form" method="post" autocomplete="off" id="view_form">
				<input type="hidden" name="n" value="${goods.goodsNum }" />
			
				<div class="inputArea">
					<label>1차 분류</label>
					<span class="category1">${goods.cateCodeRef }</span>
					<!-- <div class="inputArea"><span></span></div> -->
					<label>2차 분류</label>
					<span class="category2">${goods.cateName }</span>
				</div>
				
				<div class="inputArea">
					<label for="goodsName">상품명</label>
					<span>${goods.goodsName }</span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 가격</label>
					<span><fmt:formatNumber value="${goods.goodsPrice }" pattern="###,###,### 원" /></span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 수량</label>
					<span><fmt:formatNumber value="${goods.goodsStock }" pattern="###,### 개" /></span>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 소개</label>
					<span>${goods.goodsDesc }</span>
				</div>
				<div class="btnArea">
					<button type="button" id="modify_Btn">수정</button>
					<button type="button" id="delete_Btn">삭제</button>
					<button type="button" id="back_Btn" onclick="location.href='/admin/goods/list'">목록으로 돌아가기</button>
				</div>
			</form>
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