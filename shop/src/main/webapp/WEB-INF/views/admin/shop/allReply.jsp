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
<title>리뷰 목록</title>
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
			<h2>리뷰 목록</h2>
			<ul class="replyList">
				<c:forEach items="${reply }" var="reply">
				<li>
					<div class="replyInfo">
						<p>
							<span>작성자</span>${reply.userName } (${reply.userId })
						</p>
						<p>
							<span>작성된 이름</span> <a href="/shop/view?n=${reply.goodsNum }">바로가기</a>
						</p>
					</div>
					<div class="replyContent">
						${reply.replyCon }
					</div>
					
					<div class="replyControl">
						<form role="form" method="post">
							<input type="hidden" name="replyNum" value="${reply.replyNum }" />
							<button type="submit" class="delete_${reply.replyNum }_btn">삭제</button>
						</form>
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