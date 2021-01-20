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
<title>주문 상세</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	var form = document.orderView;
	
	/* 주문 취소 버튼 클릭 시 */
	$("#order_cancel").click(function() {
		
		if(confirm('주문을 취소하시겠습니까?')) {
			form.method = "POST";
			form.action = '/market/orderCancel';
			form.submit();
		}
	}); // $("#order_cancel").click
	
	/* 주문 수정 버튼 클릭 시 */
	$("#order_edit").click(function() {
		$(".modal_edit").attr("style", "display:block;");
	});
	
	/* 주문 수정 취소 버튼 클릭 시 */
	$("#edit_cancel").click(function() {
		$(".modal_edit").attr("style", "display:none;");
	});
	
	/* 주문 수정하기 버튼 클릭 시 */
	/* var formObj = $('form[name="orderEdit"]'); */
	var formObj = document.orderEdit;
	$("#edit_submit").click(function() {
		if(confirm('해당 정보로 수정하시겠습니까?')) {
			formObj.method = "POST";
			formObj.action = '/market/orderEdit';
			formObj.submit();	
		}
	});
	
}); // $(documnet).ready
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
			<section id="orderView">
				<h2>주문상세조회</h2>
				<form role="form" name="orderView">
				<table class="orderInfo">
					<div class="title"><h4>구매정보</h4></div>
					<tbody>
						<c:forEach items="${orderView }" var="orderView" varStatus="status">
						<c:if test="${status.first }">
						<input type="hidden" name="orderId" value="${orderView.orderId }" />
							<tr>
								<th>수령인</th>
								<td>${orderView.orderRec }</td>
								<th>주문 번호</th>
								<td>${orderView.orderId }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>(${orderView.userAddr1 }) ${orderView.userAddr2 } ${orderView.userAddr3 }</td>
								<th>연락처</th>
								<td>${orderView.orderPhone }</td>
							</tr>
							<tr>
								<th>총 주문 금액</th>
								<td><fmt:formatNumber pattern="###,###,###,###" value="${orderView.amount }" />원</td>
								<th>상태</th>
								<td>
									${orderView.delivery }
									<%-- '주문 완료'일 경우에만 주문 취소, 수정 버튼 생성 --%>
									<c:if test="${(orderView.delivery).equals('주문 완료') }">
										<button type="button" id="order_edit">배송 정보 변경</button>
										<button type="button" id="order_cancel">주문 취소</button>
									</c:if>
									<%-- '주문 취소일'이 있을 경우 날짜도 추가 --%>
									<fmt:formatDate pattern="[ yyyy-MM-dd (a)hh:mm ]" value="${orderView.cancelDate }" />									
								</td>
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				</form>
				<table class="orderView">
					<div class="title"><h4>주문상품정보</h4></div>
					<colgroup>
						<col width="125px">
						<col width="400px">
						<col width="188px">
						<col width="125px">
						<col width="px">
					</colgroup>
					<thead>
						<tr>
							<th>썸네일</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>수량</th>
							<th>합계금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderView }" var="orderView">
						<tr>
							<td><img src="${orderView.goodsThumbImg }" /></td>
							<td class="goodsName"><a href="/market/view?n=${orderView.goodsNum }">${orderView.goodsName }</a></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice }" />원</td>
							<td>${orderView.cartStock }개</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${orderView.goodsPrice * orderView.cartStock}" />원</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
	</section>
</div>
<style>

div.modal_edit {
	display: none;
    position: relative;
   	z-index: 1;
}
form#orderEdit {
    position: fixed;
    top: 20%;
    left: calc(50% - 430px);
    width: 800px;
    height: 300px;
    padding: 20px 60px;
    background: #fff;
    border: 2px solid #666;
}
.modal_edit #orderEdit h4{
    margin: 28px 0 0;
    padding-bottom: 10px;
    color: #000;
    font-size: 1.2rem;
    font-weight: bold;
}
.modal_edit #orderEdit table {
	border-top: 2px solid #555;
    border-bottom: 1px solid #ddd;
    text-align: center;
    width: 100%;
    font-size: 0.9rem;
    color: #555;
    margin-bottom: 3em;
} 
.modal_edit #orderEdit th {
	padding: 16px 0px;
    border-top: 1px solid #ddd;
    font-weight: bold;
    background: #f7f7f7;
    width: 150px;
}
.modal_edit #orderEdit td {
	text-align: left;
    padding: 16px 0px;
    padding-left: 15px;
    border-top: 1px solid #ddd;
}
div#editBg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.8);
    z-index: -1;
}
.modal_edit input[type="text"] {
	height: 25px;
    text-decoration: none;
    border: 1px #b7b7b7 solid;
}
.modal_edit input[name="userAddr1"] {
	margin-bottom: 4px;
}
.modal_edit input[name="userAddr2"] {
	width: 35%;	
	float: left;
    
}
.modal_edit input[name="userAddr3"] {
	width : 50%;
	float: left;
	margin-left: 4px;
}
.modal_edit #edit_submit {
	background-color: green;
}
.modal_edit #edit_cancel {
	background-color: #555;
}
.modal_edit button {
	float: right;
	margin-left: 10px;
}
</style>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
<div class="modal_edit">
<form role="form" name="orderEdit" id="orderEdit">
<table class="orderEdit">
	<div class="title"><h4>주문정보수정</h4></div>
	<tbody>
		<c:forEach items="${orderView }" var="orderView" varStatus="status">
		<c:if test="${status.first }">
			<input type="hidden" name="orderId" value="${orderView.orderId }" />
			<tr>
				<th>수령인</th>
				<td><input type="text" name="orderRec" value="${orderView.orderRec }" /></td>
				<th>연락처</th>
				<td><input type="text" name="orderPhone" value="${orderView.orderPhone }" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3">
					<div class="input_area addr">
						<p>
							<input type="text" id="sample6_address" name="userAddr1" placeholder="우편번호"  value="${orderView.userAddr1 }" readonly="readonly">
							<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
						</p>
						<p>
							<input type="text" id="sample6_detailAddress" name="userAddr2" placeholder="참고항목" value="${orderView.userAddr2 }" readonly="readonly">
							<input type="text" id="sample6_extraAddress" name="userAddr3" placeholder="상세주소" value="${orderView.userAddr3 }" readonly="readonly">
						</p>
						<span class="final_addr_ck">주소를 입력해주세요.</span>
					</div>
				</td>
			</tr>
			<tr>
			<td colspan="4">
				<button type="button" id="edit_submit">수정하기</button>
				<button type="button" id="edit_cancel">취소</button>
			</td>
			</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
</form>
<div id="editBg">
</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode;
                //document.getElementById("sample6_address").value = addr;
                $("[name=userAddr1]").val(data.zonecode);
                $("[name=userAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                $("[name=userAddr3]").attr("readonly",false);
                $("[name=userAddr3]").focus();
            }
        }).open();
    }
</script>
</body>
</html>