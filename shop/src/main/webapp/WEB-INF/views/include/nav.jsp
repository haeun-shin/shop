<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav_wrap">
	<c:if test="${member == null }">
		<li>
			<a href="/member/signup">회원가입</a>
		</li>
		<li>
			<a href="/member/signin">로그인</a>
		</li>	
	</c:if>
	
	<c:if test="${member != null }">
		<li>
			<a href="/member/signout">로그아웃</a>
		</li>
		<li>
			<a href="/member/memberinfo">회원정보</a>
		</li>
		<li>
			<a href="/market/orderList">주문내역</a>
		</li>
		<li>
			<a href="/market/cartList">장바구니</a>
		</li>
		
		<c:if test="${member.adminCk == 1 }">
		<li>
			<a href="/admin/goods/list">관리자화면</a>
		</li>
		</c:if>
			
		<li>
			<strong style="font-weight:bold">${member.userName }님 환영합니다.</strong>
		</li>
	
	</c:if>
</ul>