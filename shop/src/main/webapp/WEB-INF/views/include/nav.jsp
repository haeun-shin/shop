<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
<c:if test="${member == null }">
	<li>
		<a href="/member/signin">로그인</a>
	</li>	
	<li>
		<a href="/member/signup">회원가입</a>
	</li>
</c:if>
<c:if test="${member != null }">
	<li>
		<strong style="font-weight:bold">${member.userName }님 환영합니다.</strong>
	</li>
	<c:if test="${member.verify == 9 }">
	<li>
		<a href="/admin/goods/list">관리자화면</a>
	</li>
	</c:if>
	<li>
		<a href="/member/signout">로그아웃</a>
	</li>
</c:if>
</ul>