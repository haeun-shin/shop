<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<div id="root">
	<div id="header">
		<%-- 로그인, 회원가입 --%>
		<div class="top_nav">
			<%@ include file="../include/nav.jsp" %>
		</div>	
		<%-- 카테고리 --%>
		<div class="header">
			<%@ include file="../include/gnb.jsp" %>
		</div>
	</div>
	<section id="container">
		<div id="container_box">
			<section id="list_content">
				<%-- 카테고리 이름 --%>
				<c:forEach items="${list }" var="list" varStatus="status">
				<c:if test="${status.first}">
					<c:choose>
						<c:when test="${list.cateCodeRef == 100 }">
							<c:set var="cateName" value="책상"/>
						</c:when>
						<c:when test="${list.cateCodeRef == 200 }">
							<c:set var="cateName" value="의자"/>
						</c:when>
						<c:when test="${list.cateCodeRef == 300 }">
							<c:set var="cateName" value="책장/북선반"/>
						</c:when>
						<c:when test="${list.cateCodeRef == 400 }">
							<c:set var="cateName" value="서랍장/캐비넷"/>
						</c:when>
						<c:when test="${list.cateCodeRef == 500 }">
							<c:set var="cateName" value="파티션/악세서리"/>
						</c:when>
					</c:choose>
					<%-- level이 2일 경우에만 카테고리2 표시 --%>
					<h2 style="color: #003148;">
						<c:out value="${cateName }" />
						<c:if test="${level == 2 }">
							<span style="font-size: 1.2rem;color: #444;">${list.cateName }</span>
						</c:if>
					</h2>
				</c:if>
				</c:forEach>
				<ul>
					<%-- 제품 리스트 반복 --%>
					<c:forEach items="${list }" var="list">
					<li>
						<div class="list_info">
							<div class="goodsThumb">
								<a href="/market/view?n=${list.goodsNum }">
									<img src="${list.goodsThumbImg }" />
								</a>
							</div>
							<div class="goodsName">
								<a href="/market/view?n=${list.goodsNum }">${list.goodsName }</a>
							</div>
							<div class="goodsPrice">
								<fmt:formatNumber pattern="###,###,###" value="${list.goodsPrice }" />원
							</div>
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