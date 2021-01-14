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
<title>회원 정보</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
/* 유효성 검사 통과유무 변수 */
var nameCheck = false;	// 이름
var mailCheck = false;	// 이메일
var addressCheck = false;	// 주소
var phoneCheck = false;	// 연락처

/* 이메일 유효성 검사 */
var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
/* 핸드폰 유효성 검사 */
var re_phone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;

$(document).ready(function() {
	/* 회원정보 수정 버튼 클릭 시 */
	$("#memberinfo_btn").click(function() {
		var name = $("#userName").val();
		var phone = $("#userPhone").val();
		var addr = $("#userAddr3").val();
		var mail = $("#userMail").val();
		
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
            $('.final_mail_ck2').css('display', 'none');
            mailCheck = false;
        } else if(!re.test(mail)) {
        	$('.final_mail_ck2').css('display','block');
        	$('.final_mail_ck').css('display', 'none');
        	mailCheck = false;
        } else{
            $('.final_mail_ck').css('display', 'none');
            $('.final_mail_ck2').css('display', 'none');
            mailCheck = true;
        }      
        
        /* 연락처 유효성 검사 */
        if(phone == ""){
            $('.final_phone_ck').css('display','block');
            $('.final_phone_ck2').css('display', 'none');
            phoneCheck = false;
        } else if(!re_phone.test(phone)) {
        	$('.final_phone_ck2').css('display','block');
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = false;
        } else{
            $('.final_phone_ck').css('display', 'none');
            $('.final_phone_ck2').css('display', 'none');
            phoneCheck = true;
        }  
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        } else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }   
        
        /* 최종 유효성 검사 */
        if(nameCheck&&mailCheck&&phoneCheck&&addressCheck ){
        	if(confirm('회원정보를 수정하시겠습니까? ')){
        		$("#memberInfo").attr("action", "/member/memberinfo");
    	        $("#memberInfo").submit();
        	}
        	return false;
        }    
        
        return false;
	});
	
	if('${msg}' != null && '${msg}' == 'true') {
		alert('회원정보가 수정되었습니다.');
	};
});
</script>
<% 
	// 회원 수정 msg 삭제
	String msg = (String) session.getAttribute("msg");
	if(msg != null) {
		session.removeAttribute("msg");
	}
%>
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
		#memberinfo_content {
		
		}
		#memberinfo_content .baseTable {
		    border-top: 2px solid #555;
		    border-bottom: 1px solid #ddd;
		    width: 100%;
		    border-collapse: collapse;
		    border: 0;
		    empty-cells: show;
		    font-size: 12px;
		}
		.myInfoForm tbody th {
		    padding-left: 27px;
		    font-weight: bold;
		}
		.rowTable tbody th {
		    padding: 16px 0px;
		}
		.docForm tbody th, .mySection .docForm tbody td {
		    padding: 13px 0 13px 17px;
		    text-align: left;
		}
		.baseTable tbody th {
		    border-top: 1px solid #ddd;
		}
		.baseTable th {
		    background: #f7f7f7;
		}
		.myInfoForm tbody td {
		    font-size: 12px;
		}
		.docForm tbody th, .docForm tbody td {
		    padding: 13px 0 13px 17px;
		    text-align: left;
		}
		.baseTable td {
		    border-top: 1px solid #ddd;
		}
		.txtInp {
		    height: 18px;
		    padding: 5px 10px;
		    font-size: 12px;
		    border: 1px solid #bbb;
		    color: #666;
		    vertical-align: middle;
		    font-weight: normal;
		}
		#memberinfo_content > h4 {
		    margin: 28px 0 0;
		    padding-bottom: 10px;
		    color: #000;
		    font-size: 1.2rem;
		    font-weight: bold;
		    float: left;
		}
		#memberinfo_content > form >  p {
			float: right;
			margin-top: 28px;
		    margin-bottom: 11px;
		}
		#memberinfo_content p > #memberinfo_btn {
			background-color: green;
			font-size: 0.9rem;
		}
		input[readonly='readonly'] {
			background-color: #f3f3f3;
		}
	</style>
	<section id="container">
		<div id="container_box">
			<section id="memberinfo_content">
				<h4>나의 회원 정보</h4>
				<form role="form" method="post" autocomplete="off" id="memberInfo">
					<table class="baseTable rowTable docForm myInfoForm">
						<colgroup>
							<col width="140"> <col width=""> <col width="130">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">
								<label for="userId">아이디</label>
							</th>
							<td colspan="2">
								<input type="text" name="userId" value="${memberInfo.userId}" id="userId" class="txtInp" maxlength="30" style="width:178px;" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="userName">이름</label>
							</th>
							<td colspan="2">
								<input type="text" name="userName" value="${memberInfo.userName }" id="userName" class="txtInp" maxlength="30" style="width:178px;">
								<span class="final_name_ck">이름을 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="userMail">이메일</label>
							</th>
							<td colspan="2">
								<input type="email" name="userMail" value="${memberInfo.userMail}" id="userMail" class="txtInp" maxlength="30" style="width:390px;" >
								<span class="final_mail_ck">이메일을 입력해주세요.</span>
							<span class="final_mail_ck2">올바른 이메일을 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="userPhone">핸드폰번호</label>
							</th>
							<td colspan="2">
								<input type="text" name="userPhone" value="${memberInfo.userPhone }" id="userPhone" class="txtInp" maxlength="30" style="width:390px;" >
								<span class="final_phone_ck">연락처를 입력해주세요.</span>
							<span class="final_phone_ck2">010-1234-5678 형식으로 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td colspan="2">
								<p>
									<input type="text" value="${memberInfo.userAddr1 }" id="sample6_address" name="userAddr1" placeholder="우편번호" tyle="width:178px;"   readonly="readonly" class="txtInp">
									<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
								</p>
								<input type="text" value="${memberInfo.userAddr2 }" id="sample6_detailAddress" name="userAddr2" placeholder="참고항목" readonly="readonly" class="txtInp" style="width:390px;" >
								<input type="text" value="${memberInfo.userAddr3 }" id="sample6_extraAddress" name="userAddr3" placeholder="상세주소" readonly="readonly" class="txtInp" style="width:390px;" >
								<span class="final_addr_ck">주소를 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">회원가입일</th>
							<td colspan="2">
								<fmt:formatDate pattern="yyyy년 MM월 dd일 (a)hh:mm" value="${memberInfo.regDate }"/>
							</td>
						</tr>
					</table>
					<p>
						<button type="button" id="memberinfo_btn">회원정보 수정하기</button>
					</p>
				</form>
			</section>
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