<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<meta charset="UTF-8">
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
	
	<aside id="aside">
		<%@ include file="../include/aside.jsp" %>
	</aside>
	
	<section id="container">
		<div id="container_box">
			
			<section id="content">
				<ul>
					<c:forEach items="${list }" var="list">
					<li>
						<div class="goosThumb">
							<img src="${list.goodsThumbImg }" />
						</div>
						<div class="goodsName">
							<a href="/shop/view?n=${list.goodsNum }">${list.goodsName }</a>
						</div>
					</li>
					</c:forEach>
				</ul>
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