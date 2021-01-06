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
				<ul>
					<%-- 제품 리스트 반복 --%>
					<c:forEach items="${list }" var="list">
					<li>
						<div class="list_info">
							<div class="goodsThumb">
								<a href="/shop/view?n=${list.goodsNum }">
									<img src="${list.goodsThumbImg }" />
								</a>
							</div>
							<div class="goodsName">
								<a href="/shop/view?n=${list.goodsNum }">${list.goodsName }</a>
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