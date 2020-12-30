<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="./include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="./include/nav.jsp" %>
		</div>
	</nav>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="./include/footer.jsp" %>
		</div>
	</footer>
</div>
</body>
</html>