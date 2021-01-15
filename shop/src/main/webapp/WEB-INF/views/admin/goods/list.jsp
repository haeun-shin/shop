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
		<section>
			<h2>상품 목록</h2>
			<div class="list_container">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>썸네일</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.goodsNum }</td>
						<td>
							<img src="${list.goodsThumbImg }" />						
						<td>
							<a href="/admin/goods/view?n=${list.goodsNum }">${list.goodsName }</a>
						</td>
						<td>${list.cateName }</td>
						<td>
							<fmt:formatNumber value="${list.goodsPrice }" pattern="###,###,###" />
						</td>
						<td>${list.goodsStock }</td>
						<td>
							<fmt:formatDate value="${list.goodsDate }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 START -->
			<nav class="paging">
			  <ul>
			  	<%-- 이전 버튼 : 생성되지 않을 경우 버튼 비활성화 --%>
		    	<c:if test="${cri.page != 1}">
		    		<li>
			    		<a href="/admin/goods/list${pageMaker.makeQuery(pageMaker.startPage)}" >&laquo;</a>
		    		</li>
			    </c:if>
			    
			    <%-- 페이지 버튼 --%>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			    	<c:choose>
			    		<c:when test="${cri.page == idx }">
			    			<li><a href="/admin/goods/list${pageMaker.makeQuery(idx) }" style="font-weight: bold;">${idx }</a></li>
			    		</c:when>
			    		<c:otherwise>
					    	<li><a  href="/admin/goods/list${pageMaker.makeQuery(idx) }">${idx }</a></li>
			    		</c:otherwise>
			    	</c:choose>
				</c:forEach>
			    
			    
			    <%-- 다음 버튼 : 생성되지 않을 경우 버튼 비활성화 --%>
			    <c:if test="${cri.page < pageMaker.endPage && pageMaker.endPage > 0 }">
		    		<li>
			    		<a href="/admin/goods/list${pageMaker.makeQuery(pageMaker.endPage)}">&raquo;</a>
		    		</li>
			    </c:if>
			  </ul>
			</nav>
			<!-- 페이징 END -->
		</div>
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