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
<script>

/* 유효성 검사 통과유무 변수 */
var idCheck = false;	// 아이디
var idckCheck = false;	// 아이디 중복검사
var pwCheck = false;	// 비밀번호
var pwckCheck = false;	// 비밀번호 일치 확인
var nameCheck = false;	// 이름
var mailCheck = false;	// 이메일
var addressCheck = false;	// 주소

$(document).ready(function() {
	
	$("#signup_btn").click(function() {
		var id = $("#userId").val();
		var pw = $("#userPass").val();
		var pwck = $("#userPassCk").val();
		var name = $("#userName").val();
		var mail = $("#userMail").val();
		var addr = $("[name=userAddr3]").val();
		
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }        
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }    

        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }        
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }      
        
        /* 연락처 유효성 검사 */
        if(mail == ""){
            $('.final_phone_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            mailCheck = true;
        }  
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }        
        
	});
	
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
					// 아이디 중복이 없는 경우
					idckCheck = true;
				} else {
					$(".id_input_re_2").css("display", "inline-block");
					$(".id_input_re_1").css("display", "none");
					// 아이디 중복된 경우
					idckCheck = false;
				}
			}
		});
	});
	
	/* 비밀번호 확인 일치 유효성 검사 */
	$('#userPassCk').on("propertychange change keyup paste input", function(){
	    var pw = $('#userPass').val();
	    var pwck = $('#userPassCk').val();
	    $('.final_pwck_ck').css('display', 'none');
	    
	    if(pw == pwck) {
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    } else {
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
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
	
	<style>
		.signup_box > label {
			display: inline-block;
			width: 100%;
		}
		.signup_box .addr #sample6_postcode {
			width: 80%;
		}
		.signup_box .addr input[type="button"] {
		    width: 19.2%;
		       height: 44px;
		}	
		.id_input_re_1 {
			color: green;
			display: none;
		}
		.id_input_re_2 {
			color: red;
			display: none;
		}
		/* 유효성 검사 문구 */
		.final_id_ck{
		    display: none;
		    color: red;
		}
		.final_pw_ck{
		    display: none;
		    color: red;
		}
		.final_pwck_ck{
		    display: none;
		    color: red;
		}
		.final_name_ck{
		    display: none;
		    color: red;
		}
		.final_mail_ck{
		    display: none;
		    color: red;
		}
		.final_addr_ck{
		    display: none;
		    color: red;
		}
		.final_phone_ck{
		    display: none;
		    color: red;
		}
		
		/* 비밀번호 확인 일치 유효성검사 */
		.pwck_input_re_1{
	        color : green;
	        display : none;    
		}
		.pwck_input_re_2{
	        color : red;
	        display : none;    
		}   
		#container_box .signup_box input[type=text], #container_box .signup_box input[type=password] {
			margin-bottom: 0;
		}
		#container_box .signup_box .input_area {
			margin-bottom: 1em;
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
						<input type="text" id="userId" name="userId"/>
						<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
						<span class="final_id_ck">아이디를 입력해주세요.</span>
					</div>

					<div class="input_area">
						<label for="userPass">비밀번호</label>
						<input type="password" id="userPass" name="userPass" />
						<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					</div>
					
					<div class="input_area">
						<label for="userPass">비밀번호 확인</label>
						<input type="password" id="userPassCk" name="userPassCk" />
						<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
						<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                		<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
					</div>
					
					<div class="input_area">
						<label for="userName">이름</label>
						<input type="text" id="userName" name="userName" placeholder="홍길동" />
						<span class="final_name_ck">이름을 입력해주세요.</span>
					</div>
					
					<div class="input_area">
						<label for="userMail">이메일</label>
						<input type="email" id="userMail" name="userMail" placeholder="hong@naver.com"/>
						<span class="final_mail_ck">이메일을 입력해주세요.</span>
					</div>
					
					<div class="input_area">
						<label for="userPhone">연락처</label>
						<input type="text" id="userPhone" name="userPhone" placeholder="010-1234-5678" />
						<span class="final_phone_ck">연락처를 입력해주세요.</span>
					</div>
					
					
					<div class="input_area addr">
						<label for="userMail">주소</label>
						<p>
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
						</p>
						<p>
							<input type="text" id="sample6_address" name="userAddr1" placeholder="주소" readonly="readonly"><br>
							<input type="text" id="sample6_detailAddress" name="userAddr2" placeholder="상세주소" readonly="readonly">
							<input type="text" id="sample6_extraAddress" name="userAddr3" placeholder="참고항목" readonly="readonly">
						</p>
						<span class="final_addr_ck">주소를 입력해주세요.</span>
					</div>
						
						
					</div>
					
					<button type="button" id="signup_btn" name="signup_btn">회원가입</button>
				</form>
			</section>
			</div>
		</div>
	</section> 
	
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
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
</body>
</html>