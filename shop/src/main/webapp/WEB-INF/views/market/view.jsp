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
	
	<%-- ajax를 이용한 댓글 작성 --%>
	$("#reply_btn").click(function() {
		var formObj = $(".replyForm form[role='form']");
		var goodsNum = $("#goodsNum").val();
		var replyCon = $("#replyCon").val();
		
		if(replyCon == null || replyCon == '') {
			alert('내용을 입력해주세요.');
			return false;
		} 
		
		var data = {
			goodsNum : goodsNum,
			replyCon : replyCon
		};
		// success : 데이터 전송이 성공했을 때 실행할 함수
		// -> 댓글 전송이 성공적으로 되면 댓글 목록을 불러오는 함수 실행
		// -> $("#replyCon").val(""); 은 댓글 작성 후에도 그대로 남아 있어 초기화 시켜 줌
		$.ajax({
			url : "/market/view/registReply",
			type : "post",
			data : data,
			success : function() {
				replyList();
				$("#replyCon").val("");
			}
		});
	}); // #reply_btn
	
	<%-- 댓글 수정 스크립트 ajax --%>
	$(".modal_modify_btn").click(function() {
		var modifyConfirm = confirm("정말로 수정하시겠습니까?");
		
		if(modifyConfirm){
			var data = {
					replyNum : $(this).attr("data-replyNum"),
					replyCon : $(".modal_replyCon").val()
			};
			
			$.ajax({
				url : "/market/view/modifyReply",
				type : "post",
				data : data,
				success : function(result) {
					if(result == 1) {
						replyList();
						$(".replyModal").fadeOut(200);
					} else {
						alert("작성자 본인만 수정할 수 있습니다.");
					}
				},
				error : function() {
					alert("로그인 후 이용하실 수 있습니다.");
				}
			}); // ajax
		} // if(modifyConfirm)
	}); // modal_modify_btn
	
	<%-- 댓글 수정 모달 팝업 취소버튼 클릭 시 --%>
	$(".modal_cancel").click(function() {
		//$(".replyModal").attr("style", "display: none;");
		$(".replyModal").fadeOut(200);
	});
	
	<%-- 카트 담기 --%>
	$(".addCart_btn").click(function() {
		var goodsNum = $("#goodsNum").val();
		var cartStock = $(".numBox").val();
		var data = {
			goodsNum : goodsNum,
			cartStock : cartStock
		};
		
		$.ajax({
			url : "/market/view/addCart",
			type : "post",
			data : data,
			success : function(result) {
				if(result == 1) {
					alert("카트에 담았습니다.");
				} else {
					alert("로그인 후 이용하실 수 있습니다.");
				}
				$(".numBox").val("1");
			},
			error : function() {
				alert("카트 담기 실패");
			}
		});
	}); // .addCart_btn
	
}); // document.ready()

<%-- JSON을 이용한 비동기식으로 댓글 목록 가져오기 --%>
function replyList() {
	var goodsNum = ${view.goodsNum};
	// $.getJSON() : 비동기식으로 JSON 데이터를 가져오는 메서드
	// 1. 주소에 접속해 데이터를 가져오고
	$.getJSON("/market/view/replyList" + "?n=" + goodsNum, function(data) {
		var str = "";
		
		// 2. 그 데이터를 이용해
		$(data).each(function() {
			console.log(data);
			
			var replyDate = new Date(this.replyDate);
			// 테이블에 저장된 날짜와 컨트롤러에서 뷰로 보낼 때의 날짜 데이터 형식이
			// 다르기 때문에, toLocaleDateString()을 이용해 1차적으로 데이터 가공
			replyDate = replyDate.toLocaleDateString("ko-US");
			
			// 3. html 코드를 조립하여
			// 댓글 목록
			str += "<li data-replyNum-'" + this.replyNum + "'>"
					+ "<div class='userInfo'>"
					+ 	"<span class='userName'>" + this.userName + "</span>"
					+ "</div>"
					+ "<div class='replyContent'>" 
					+ 	"<div class='con'>" + this.replyCon + "</div>" 
					+   "<c:if test='${member != null}'>"
					+   "<div class='replyFotter'>"
					+   	"<button type='button' class='modify' data-replyNum='" + this.replyNum + "'>수정</button>"
					+   	"<button type='button' class='delete' data-replyNum='" + this.replyNum + "'>삭제</button>"
					+   "</div>"
					+   "</c:if>"
					+ "</div>"
					+ "<div class='userDate'>"
					+ 	"<span class='date'>" + replyDate + "</span>"
					+ "</div>"
					+"</li>";
			
		});
		// 4. ol 태그에 추가
		$("section.replyList ol").html(str);
	}); //$.getJSON
} // replyList()

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
							<c:if test="${view.goodsStock != 0 }" >
							<button type="button" class="minus">-</button>
							<input type="number" class="numBox" min="1" max="${view.goodsStock }" value="1" readonly/>
							<button type="button" class="plus">+</button>
							</c:if>
							<c:if test="${view.goodsStock <= 0 }">
								<p>재고가 없습니다.</p>
							</c:if>
							</dd>
						</dl>
						<p class="addToCart">
							<button type="button" class="addCart_btn">카트에 담기</button>
						</p>
					</div>
				</div>
				
				<ul class="goodsMove" id="goodsMove">
					<li><a href="#goodsMove">상품 설명</a></li>
					<li><a href="#reply">상품 리뷰</a></li>
				</ul>
				<%-- 제품 소개 --%>
				<div class="goodsDesc" id="goodsDesc">
					${view.goodsDesc }
				</div>
			</div>
			
			<ul class="replyMove">
				<li><a href="#goodsMove">상품 설명</a></li>
				<li><a href="#reply">상품 리뷰</a></li>
			</ul>
			
			<%-- 댓글 --%>
			<div id="reply">
				<%-- if: 로그아웃 시 로그인 문구 --%>
				<c:if test="${member == null }">
				<p class="replyAlert">리뷰를 작성하시려면 <a href="/member/signin">로그인</a>해주세요.</p>
				</c:if>
				
				<%-- if: 로그인 시 댓글 작성 폼 --%>
				<c:if test="${member != null }">
				<section class="replyForm">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="goodsNum" id="goodsNum" value="${view.goodsNum }"/>
						
						<div class="input_area">
							<textarea name="replyCon" id="replyCon" rows="5"></textarea>
						</div>
						<div class="input_area">
							<button type="button" id="reply_btn">리뷰 쓰기</button>
						</div>
					</form>
				</section>
				</c:if>

				<section class="replyList">
					<%-- 댓글 목록이 생성되는 위치 ol 태그 안 --%>
					<ol>
					</ol>
				</section>
				
				<%-- JSON을 이용한 비동기식으로 댓글 목록 가져오기 --%>
				<script>replyList();</script>
				
				<script>
					<%-- 댓글 수정 모달 팝업 --%>
					// 소감 목록은 스크립트로 인해 생성된 동적인 HTML 코드로, 
					// 일반적인 클릭 메서드 .click()이 아니라 .on() 메서드를 사용
					$(document).on("click", ".modify", function(){
						//$(".replyModal").attr("style", "display:block;");
						$(".replyModal").fadeIn(200);
						// 버튼에 있는 data-replyNum 값 저장
						var replyNum = $(this).attr("data-replyNum");
						// 부모요소, 부모요소, 안에있는 .replyContent의 텍스트 저장
						var replyCon = $(this).parent().parent().parent().children(".replyContent").children(".con").text();
						
						// 모달 팝업 안에 텍스트 넣기
						$(".modal_replyCon").val(replyCon);
						// 댓글 수정 버튼에 replyNum 값 넣기
						$(".modal_modify_btn").attr("data-replyNum", replyNum);
					});
				</script>
				
				<script>
					<%-- 댓글 삭제 스크립트 ajax --%>
					// 소감 목록은 스크립트로 인해 생성된 동적인 HTML 코드로, 
					// 일반적인 클릭 메서드 .click()이 아니라 .on() 메서드를 사용
					$(document).on("click", ".delete", function(){
						var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
						
						// confirm이 true면 실행
						if(deleteConfirm) {
							var data = {
									replyNum : $(this).attr("data-replyNum")
							}
							// 댓글 삭제 가 성공하면 댓글목록을 다시 불러옴
							// error : nullPoiontException이 생기면 실행
							$.ajax({
								url : "/market/view/deleteReply",
								type : "post",
								data : data,
								success : function(result) {
									if(result == 1) {
										replyList();
									} else {
										alert("작성자 본인만 삭제할 수 있습니다.");
									}
								},
								error : function() {
									alert("로그인 후 이용하실 수 있습니다.");
								}
							}); // ajax
						} // if(deleteConfrim)
					}); // .delete
				</script>
			</div>
			
			
		</div>
	</section>
	
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
<%-- 댓글 수정 모달 팝업 --%>
<div class="replyModal">
	<div class="modalContent">
		<div>
			<textarea class="modal_replyCon" name="modalReplyCon"></textarea>
		</div>
		<div>
			<button type="button" class="modal_modify_btn">수정</button>
			<button type="button" class="modal_cancel">취소</button>
		</div>
	</div>
	
	<div class="modalBackground"></div>
</div>
</body>
</html>
