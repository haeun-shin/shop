<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<title>Shop</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<!-- https://bxslider.com/install/ -->
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>

$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 4000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        //autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        slideWidth: 1920
    });
});

</script>

</head>
<body>
<div id="root">
	<div id="header">
		<%-- 로그인, 회원가입 --%>
		<div class="top_nav">
			<%@ include file="./include/nav.jsp" %>
		</div>	
		<%-- 카테고리 --%>
		<div class="header">
			<%@ include file="./include/gnb.jsp" %>
		</div>
	</div>
	<style>
		
	</style>
	
	<section id="home">
		<!-- <div id="container_box"> -->
			<div class="main_banner">
				<div class="slider_wrap">
				    <ul class="bxslider">
				        <li><a href="#"><img src="https://via.placeholder.com/1420x600" /></a></li>
				        <li><a href="#"><img src="https://via.placeholder.com/1420x600" /></a></li>
				        <li><a href="#"><img src="https://via.placeholder.com/1420x600" /></a></li>
				    </ul>
				</div>
			</div>
		<!-- </div> -->
	</section>
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="include/footer.jsp" %>
	</div>
</footer>
</body>
</html>
