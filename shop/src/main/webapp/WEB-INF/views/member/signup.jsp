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
<script src="/resources/js/jquery-3.3.1.min.js"></script>
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
	
	<!-- <section id="container">
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
	</section> -->
	<style>
		.id_input_re_1 {
			color: green;
			display: none;
		}
		.id_input_re_2 {
			color: red;
			display: none;
		}
	</style>
	<section id="container">
		<div id="container_box" >
			<div  class="signup_box">
			<h2 style="text-align:center">회원가입</h2>
			<section id="content">
				<form role="form" method="post" autocomplete="off" id="signup_form">
					<div class="input_area">
						<label for="userId">아이디</label>
						<input type="text" id="userId" name="userId" required="required" />
						<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					</div>
					<script>
						<%-- 아이디 중복 검사 --%>
						$("#userId").on("propertychange change keyup paste input", function() {
							var userId = $('#userId').val();
							var data = {
									userId : userId
							}
							$.ajax({
								type: "post",
								url: "/member/memberIdChk",
								data : data,
								success : function(result) {
									if(result != 'fail') {
										$(".id_input_re_1").css("display", "inline-block");
										$(".id_input_re_2").css("display", "none");
									} else {
										$(".id_input_re_2").css("display", "inline-block");
										$(".id_input_re_1").css("display", "none");
									}
								}
							});
						});
					</script>
					<div class="input_area">
						<label for="userPass">패스워드</label>
						<input type="password" id="userPass" name="userPass" required="required" />
					</div>
					
					<div class="input_area">
						<label for="userName">이름</label>
						<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요." required="required" />
					</div>
					
					<div class="input_area">
						<label for="userMail">이메일</label>
						<input type="email" id="userMail" name="userMail" placeholder="이메일을 입력해주세요." required="required" />
					</div>
					
					<div class="input_area">
						<label for="userPhone">연락처</label>
						<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요." required="required" />
					</div>
					
					<div class="input_area">
						<label for="userMail">주소</label>
						<p>
							<input type="text" id="sample3_postcode" placeholder="우편번호">
							<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
						</p>
						<p>
							<input type="text" id="sample3_address" name="userAddr1" placeholder="주소"><br>
							<input type="text" id="sample3_extraAddress" name="userAddr3" placeholder="참고항목">
							<input type="text" id="sample3_detailAddress" name="userAddr2" placeholder="상세주소">
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