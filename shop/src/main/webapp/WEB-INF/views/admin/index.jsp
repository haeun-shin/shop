<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>관리자페이지</title>
</head>
<body>
<div id="root">
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="./include/nav.jsp" %>
		</div>
	</nav>

	<header id="header">
		<div id="header_box">
			<%@ include file="./include/header.jsp" %>
		</div>
	</header>
	
	<section id="container">
		<aside>
			<%@ include file="./include/aside.jsp" %>
		</aside>
	</section>
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="./include/footer.jsp" %>
	</div>
</footer>
</body>
</html>