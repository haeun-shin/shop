<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<title>회원가입</title>
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
		<div id="container_box" >
			<div  class="signup_box">
			<h2 style="text-align:center">회원가입</h2>
			<section id="content">
				<form role="form" method="post" autocomplete="off" id="signup_form">
					<div class="input_area">
						<label for="userId">아이디</label>
						<input type="email" id="userId" name="userId" placeholder="example@email.com" required="required" />
					</div>
					
					<div class="input_area">
						<label for="userPass">패스워드</label>
						<input type="password" id="userPass" name="userPass" required="required" />
					</div>
					
					<div class="input_area">
						<label for="userName">닉네임</label>
						<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요." required="required" />
					</div>
					
					<div class="input_area">
						<label for="userPhone">연락처</label>
						<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요." required="required" />
					</div>
					
					<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
				</form>
			</section>
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