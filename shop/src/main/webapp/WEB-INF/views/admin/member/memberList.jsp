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
<style>
#member_list {
	
}
#member_list > table {
	width: 100%;
    border-top: 2px solid #555;
    border-bottom: 1px solid #ddd;
    text-align: center;
}
#member_list thead th {
    padding: 14px 0;
	color: #000;
	background: #f7f7f7;
	font-weight: bold;
}
#member_list tbody td {
    padding: 16px 0px;
    border-top: 1px solid #ddd;
}
</style>
		<div id="container_box">
			<section id="member_list">
			<table>
				<thead>
					<tr>
						<th></th>
						<th>분류</th>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>상태</th>
						<th>가입일</th>
						<th>탈퇴일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList }" var="memberList" varStatus="status">
					<tr onClick="">
						<td style="padding-left: 15px;">${status.count }</td>
						<td>
							<c:if test="${memberList.adminCk == 0}">회원</c:if>
							<c:if test="${memberList.adminCk == 1}">관리자</c:if>
						</td>
						<td>${memberList.userId }</td>
						<td>${memberList.userName }</td>
						<td>${memberList.userPhone }</td>
						<td>
							<c:if test="${memberList.status.equals('Y') }"><span style="color: green;">가입</span></c:if>
							<c:if test="${memberList.status.equals('N') }"><span style="color: red;">탈퇴</span></c:if>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd (a)hh:mm" value="${memberList.regDate }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd (a)hh:mm" value="${memberList.dropDate }"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</section><!-- #orderView -->
		</div><!-- #container_box -->
	</section><!-- #container -->
</div><!-- #root -->

<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
</body>
</html>