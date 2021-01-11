<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common_style.css">
<title>장바구니</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	<%-- 모두 선택 (장바구니 제품) --%>	
	$("#allCheck").click(function() {
		// 1. #allCheck가 체크된 상태를 변수에 저장
		var chk = $("#allCheck").prop("checked");
		
		// 2. 체크된 상태라면, 나머지 체크박스인 .ckBox 체크
		if(chk) {
			$(".ckBox").prop("checked", true);
		// 3. 아니라면, 체크 해제
		} else {
			$(".ckBox").prop("checked", false);
		}
	});
	
	<%-- 개별 선택 시, 모두 선택 체크 해제 --%>
	$(".ckBox").click(function() {
		$("#allCheck").prop("checked", false);
	});
	
	<%-- 체크 제품 삭제 --%>
	$(".selectDelete_btn").click(function() {
		var confirm_val = confirm("상품을 삭제하시겠습니까?");
		
		if(confirm_val) {
			var checkArr = new Array();
			// 체크된 상태의 input의 data-cartNum을 array에 put
			$("input[class='ckBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cartNum"));
			});
			
			$.ajax({
				url: "/shop/deleteCart",
				type: "post",
				data: {
					checkArr : checkArr
				},
				success: function(result) {
					if(result == 1) {
						location.href="/shop/cartList";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	});
	
	<%-- 해당 제품 삭제 --%>
	$(".delete_btn").click(function() {
		var confirm_val = confirm("상품을 삭제하시겠습니까?");
		
		if(confirm_val) {
			var checkArr = new Array();
			
			checkArr.push($(this).attr("data-cartNum"));
			
			$.ajax({
				url: "/shop/deleteCart",
				type: "post",
				data: {
					checkArr : checkArr
				},
				success: function(result) {
					if(result == 1) {
						location.href = "/shop/cartList";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	});
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
			<section id="cartList">
				<table>
					<colgroup>
						<col width="62px">
						<col width="125px">
						<col width="377px">
						<col width="125px">
						<col width="126px">
						<col width="188px">
						<col width="127px">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck"></th>
							<th>상품 사진</th>
							<th>상품 이름</th>
							<th>판매 가격</th>
							<th>수량</th>
							<th>주문 금액</th>
							<th><button type="button" class="selectDelete_btn">선택 삭제</button></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0" />
						<c:forEach items="${cartList }" var="cartList">
						<tr class="cartInfo">
							<td><input type="checkbox" name="ckBox" class="ckBox" data-cartNum="${cartList.cartNum }"/></td>
							<td><img src="${cartList.goodsThumbImg }" /></td>
							<td class="cartGoodsName"><a href="/shop/view?n=${cartList.goodsNum }">${cartList.goodsName }</a></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${cartList.goodsPrice }"/> 원</td>
							<td>${cartList.cartStock } 개</td>
							<td><fmt:formatNumber pattern="###,###,###,###" value="${cartList.goodsPrice * cartList.cartStock }" /> 원</td>
							<td><button type="button" class="delete_btn" data-cartNum="${cartList.cartNum }">삭제</button></td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.goodsPrice * cartList.cartStock) }" />
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>합계금액 <fmt:formatNumber pattern="###,###,###,###" value="${sum }"/>원</td>
						</tr>
					</tfoot>
				</table>
				<div class="orderOpen">
					<button type="button" class="orderOpen_btn">주문 정보 입력</button>
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