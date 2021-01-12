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
				</table>
				<p class="cartOrderSum">
					<strong>결제 금액 <span><fmt:formatNumber pattern="###,###,###,###" value="${sum }"/>원</span></strong>
				</p>
				<div class="orderOpen">
					<button type="button" class="orderOpen_btn">주문 정보 입력</button>
				</div>
				<script>
					<%-- 주문정보입력 창 열기 --%>
					$(".orderOpen_btn").click(function() {
						$(".orderInfo").slideDown();
						/* $(".orderOpen_btn").slideUp(); */
					});
				</script>
				<div class="orderInfo">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="amount" value=${sum } />
						
						<table>
							<tbody>
								<tr>
									<th>수령인</th>
									<td><input type="text" name="orderRec" id="orderRec" required="required" /></td>
									<th>수령인 연락처</th>
									<td><input type="text" name="orderPhone" id="orderPhone" required="required" /></td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="3">
										<p>
											<input type="text" id="sample3_postcode" placeholder="우편번호">
											<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
										</p>
										<p>
											<input type="text" id="sample3_address" name="userAddr1" placeholder="주소"><br>
											<input type="text" id="sample3_detailAddress" name="userAddr2" placeholder="상세주소">
											<input type="text" id="sample3_extraAddress" name="userAddr3" placeholder="참고항목">
										</p>
										
										<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										
										<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										    // 우편번호 찾기 찾기 화면을 넣을 element
										    var element_wrap = document.getElementById('wrap');
										
										    function foldDaumPostcode() {
										        // iframe을 넣은 element를 안보이게 한다.
										        element_wrap.style.display = 'none';
										    }
										
										    function sample3_execDaumPostcode() {
										        // 현재 scroll 위치를 저장해놓는다.
										        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var addr = ''; // 주소 변수
										                var extraAddr = ''; // 참고항목 변수
										
										                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    addr = data.roadAddress;
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    addr = data.jibunAddress;
										                }
										
										                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										                if(data.userSelectedType === 'R'){
										                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
										                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										                        extraAddr += data.bname;
										                    }
										                    // 건물명이 있고, 공동주택일 경우 추가한다.
										                    if(data.buildingName !== '' && data.apartment === 'Y'){
										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                    }
										                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										                    if(extraAddr !== ''){
										                        extraAddr = ' (' + extraAddr + ')';
										                    }
										                    // 조합된 참고항목을 해당 필드에 넣는다.
										                    document.getElementById("sample3_extraAddress").value = extraAddr;
										                
										                } else {
										                    document.getElementById("sample3_extraAddress").value = '';
										                }
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('sample3_postcode').value = data.zonecode;
										                document.getElementById("sample3_address").value = addr;
										                // 커서를 상세주소 필드로 이동한다.
										                document.getElementById("sample3_detailAddress").focus();
										
										                // iframe을 넣은 element를 안보이게 한다.
										                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
										                element_wrap.style.display = 'none';
										
										                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
										                document.body.scrollTop = currentScroll;
										            },
										            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										            onresize : function(size) {
										                element_wrap.style.height = size.height+'px';
										            },
										            width : '100%',
										            height : '100%'
										        }).embed(element_wrap);
										
										        // iframe을 넣은 element를 보이게 한다.
										        element_wrap.style.display = 'block';
										    }
										</script>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_group">
							<button type="submit" class="order_btn">주문</button>
							<button type="button" class="cancel_btn">취소</button>
						</div>
						<script>
							<%-- 주문정보입력 창 닫기 --%>
							$(".cancel_btn").click(function() {
								$(".orderInfo").slideUp();
								/* $(".orderOpen_btn").slideDown(); */
							});
						</script>
					</form>
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