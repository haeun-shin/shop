<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<span class="category2"></span>
				</div>
				
				<div class="inputArea">
					<label for="goodsName">상품명</label>
					<input type="text" id="goodsName" name="goodsName" value=""/>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 가격</label>
					<input type="text" id="goodsPrice" name="goodsPrice" value=""/>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 수량</label>
					<input type="text" id="goodsStock" name="goodsStock" value=""/>
				</div>
				<div class="inputArea">
					<label for="goodsName">상품 소개</label>
					<input type="text" id="goodsDesc" name="goodsDesc" value=""/>
				</div>
				<div class="inputArea">
					<button type="submit" id="register_Btn">등록</button>
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