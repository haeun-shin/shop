<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<title>Shop</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	
	<%-- 구매 수량 스크립트 START --%>
	// 수량 증가
	$(".plus").click(function() {
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		
		if(plusNum >= ${view.goodsStock}) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);
		}
	});
	
	// 수랑 감소
	$(".minus").click(function() {
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1;
		
		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);
		}
	});
	<%-- 구매 수량 스크립트 END --%>
	
	<%-- JSON을 이용한 비동기식 댓글 등록 --%>
	function replyList() {
		var goodsNum = ${view.goodsNum};
		// $.getJSON() : 비동기식으로 JSON 데이터를 가져오는 메서드
		// 1. 주소에 접속해 데이터를 가져오고
		$.getJSON("/shop/view/replyList" + "?n=" + goodsNum, function(data) {
			var str = "";
			
			// 2. 그 데이터를 이용해
			$(data).each(function() {
				console.log(data);
				
				var replyDate = new Date(this.replyDate);
				// 테이블에 저장된 날짜와 컨트롤러에서 뷰로 보낼 때의 날짜 데이터 형식이
				// 다르기 때문에, toLocaleDateString()을 이용해 1차적으로 데이터 가공
				replyDate = replyDate.toLocaleDateString("ko-US");
				
				// 3. html 코드를 조립하여
				str += "<li data-goosNum-'" + this.goodsNum + "'>"
						+ "<div class='userInfo'>"
						+ 	"<span class='userName'>" + this.userName + "</span>"
						+ 	"<span class='date'>" + replyDate + "</span>"
						+ "</div>"
						+ "<div class='replyContent'>" + this.replyCon + "</div>"
						+"</li>";
				
			});
			// 4. ol 태그에 추가
			$("section.replyList ol").html(str);
		}); //$.getJSON
	} // replyList()
});
</script>

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
			<form role="form" method="post">
				<%-- 장바구니 추가, 리뷰 기능을 위한 hidden --%>
				<input type="hidden" name="goodsNum" value="${view.goodsNum }" />
			</form>
			<%-- 제품 상세 --%>
			<div class="goods">
				<div class="goods_wrap">
					<%-- 썸네일 --%>
					<div class="goodsImg">
						<img src="${view.goodsImg }" />
					</div>
					<%-- 제품 정보 --%>
					<div class="goodsInfo">
						<p class="cateName">
							${view.cateName }
						</p>
						<p class="goodsName">
							${view.goodsName }
						</p>
						
						<hr />
						
						<dl class="goodsDetail goodsPrice">
							<dt>가격</dt>
							<dd><fmt:formatNumber pattern="###,###,###" value="${view.goodsPrice }" /> 원</dd>
						</dl>
						<dl class="goodsDetail goodsStock">
							<dt>재고</dt>
							<dd><fmt:formatNumber pattern="###,###,###" value="${view.goodsStock }" /> EA</dd>
						</dl>
						<dl class="goodsDetail cartStock">
							<dt>주문 수량</dt>
							<dd>
							<button type="button" class="minus">-</button>
							<input type="number" class="numBox" min="1" max="${view.goodsStock }" value="1" readonly/>
							<button type="button" class="plus">+</button>
							</dd>
						</dl>
						<p class="addToCart">
							<button type="button">카트에 담기</button>
						</p>
					</div>
				</div>
				
				<hr />
				
				<%-- 제품 소개 --%>
				<div class="goodsDesc" >
					${view.goodsDesc }
				</div>
			</div>
			
			<%-- 댓글 --%>
			<div id="reply">
				<%-- if: 로그아웃 시 로그인 문구 --%>
				<c:if test="${member == null }">
				<p>소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요.</p>
				</c:if>
				
				<%-- if: 로그인 시 댓글 작성 폼 --%>
				<c:if test="${member != null }">
				<section class="replyForm">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="goodsNum" value="${view.goodsNum }" />
						
						<div class="input_area">
							<textarea name="replyCon" id="replyCon"></textarea>
						</div>
						<div class="input_area">
							<button type="button" id="reply_btn">소감 남기기</button>
						</div>

					</form>
				</section>
				</c:if>
				
				<section class="replyList">
					<ol>
						<%-- <c:forEach items="${reply }" var="reply">
						<li>
							<div class="userInfo">
								<span class="userName">${reply.userName }</span>
								<span class="date">
									<fmt:formatDate value="${reply.replyDate }" pattern="yyyy-MM-dd" />
								</span>
								<div class="replyContent">${reply.replyCon }</div>
							</div>
						</li>
						</c:forEach> --%>
					</ol>
				</section>
				<%-- Ajax를 이용한 비동기식 소감 등록 함수 --%>
				<script>replyList();</script>
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
