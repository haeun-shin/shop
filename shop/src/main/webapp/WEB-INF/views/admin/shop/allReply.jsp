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
			<div class="relpy_list">
				<table>
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<td>이름</td>
							<td>아이디</td>
							<td>내용</td>
							<td>작성일</td>
							<td>링크</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reply }" var="reply">
						<tr>
							<td>${reply.userName }</td>
							<td>${reply.userId }</td>
							<td>${reply.replyCon }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replyDate }" /></td>
							<td><a href="/shop/view?n=${reply.goodsNum }#reply">바로가기</a></td>
							<td>
								<div class="replyControl">
									<form role="form" method="post">
										<input type="hidden" name="replyNum" value="${reply.replyNum }" />
										<button type="submit" class="delete_${reply.replyNum }_btn">삭제</button>
									</form>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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