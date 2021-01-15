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
<title>회원 목록</title>
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
						<td style="padding-left: 15px;">${status.count + ((cri.page - 1)*10)}</td>
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
			<!-- 페이징 START -->
			<nav class="paging">
			  <ul>
			  	<%-- 이전 버튼 : 생성되지 않을 경우 버튼 비활성화 --%>
		    	<c:if test="${cri.page != 1}">
		    		<li>
			    		<a href="/admin/member/memberList${pageMaker.makeQuery(pageMaker.startPage)}" >&laquo;</a>
		    		</li>
			    </c:if>
			    
			    <%-- 페이지 버튼 --%>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			    	<c:choose>
			    		<c:when test="${cri.page == idx }">
			    			<li><a href="/admin/member/memberList${pageMaker.makeQuery(idx) }" style="font-weight: bold;">${idx }</a></li>
			    		</c:when>
			    		<c:otherwise>
					    	<li><a  href="/admin/member/memberList${pageMaker.makeQuery(idx) }">${idx }</a></li>
			    		</c:otherwise>
			    	</c:choose>
				</c:forEach>
			    
			    
			    <%-- 다음 버튼 : 생성되지 않을 경우 버튼 비활성화 --%>
			    <c:if test="${cri.page < pageMaker.endPage && pageMaker.endPage > 0 }">
		    		<li>
			    		<a href="/admin/member/memberList${pageMaker.makeQuery(pageMaker.endPage)}">&raquo;</a>
		    		</li>
			    </c:if>
			  </ul>
			</nav>
			<!-- 페이징 END -->
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