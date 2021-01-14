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
        //captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        slideWidth: 1920,
        touchEnabled : (navigator.maxTouchPoints > 0) // 버전 업데이트되면서 a가 안먹힘. 이걸 넣으면 됨.
    });
});

</script>
<style>
.sliderImg1 {
    background-image: url(/resources/images/shop_main1_02.jpg);
}
.sliderImg2 {
	background-image: url(/resources/images/shop_main2_02.jpg);
}
.sliderImg3 {
    background-image: url(/resources/images/shop_main3_02.jpg);
}
.sliderImg a img {
	text-align: center;
}
</style>
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
	<section id="home">
		<div class="main_banner">
			<div class="slider_wrap">
			    <ul class="bxslider">
			        <li class="sliderImg sliderImg3"><a href="/shop/view?n=17"></a></li>
			        <li class="sliderImg sliderImg1"><a href="/shop/view?n=53"></a></li>
			        <li class="sliderImg sliderImg2"><a href="/shop/view?n=50"></a></li>
			    </ul>
			</div>
		</div>
	</section>
	<section id="middle">
		<div class="middle_banner">
			<div class="list-card">
				<ul>						
					<li>
						<a href="#" >
							<div class="thumbnail">
								<img src="/resources/images/middle_1.jpg" alt="">
							</div>
							<div class="desc">
								<p class="headline">
									<span class="ellipsis">수납하면 이거지~</span>
									<b class="discount color-red">~85%</b>
								</p>										
								<p class="subcopy">											
									직장인 수납왕들이 찾는 BEST 제품!
								</p>
							</div>
						</a>
					</li>			
					<li>
						<a href="#" >
							<div class="thumbnail">
								<img src="/resources/images/middle_2.jpg" alt="">
							</div>
							<div class="desc">
								<p class="headline">
									<span class="ellipsis">마이 홈오피스 메이트 LITEM</span>
									<b class="discount color-red">~30%</b>
								</p>										
								<p class="subcopy">											
									홈오피스를 심플하고 깔끔하게 꾸미자
								</p>
							</div>
						</a>
					</li>			
					<li>
						<a href="#" >
							<div class="thumbnail">
								<img src="/resources/images/middle_3.jpg" alt="">
							</div>
							<div class="desc">
								<p class="headline">
									<span class="ellipsis">수납+데코=아이카사</span>
									<b class="discount color-red">~20%</b>
								</p>										
								<p class="subcopy">											
									데코까지 되는 멋진 수납함
								</p>
							</div>
						</a>
					</li>			
				</ul>
			</div>
		</div>
	</section>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="./include/footer.jsp" %>
	</div>
</footer>
</body>
</html>
