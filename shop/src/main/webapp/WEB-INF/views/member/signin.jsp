<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>로그인</title>
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
		<div id="container_box" class="signin_box">
			<h2>로그인</h2>
			<section id="content">
				<form role="form" method="post" autocomplete="off">
					<div class="input_area">
						<label for="userId">아이디</label>
						<input type="email" id="userId" name="userId" required="required" />
					</div>
					
					<div class="input_area">
						<label for="userPass">패스워드</label>
						<input type="password" id="userPass" name="userPass" required="required" />
					</div>
					
					<button type="submit" id="signin_btn" name="signin_btn">로그인</button>
					
					<c:if test="${msg == false }">
						<p style="color:#f00;">로그인에 실패했습니다.</p>
					</c:if>
				</form>
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