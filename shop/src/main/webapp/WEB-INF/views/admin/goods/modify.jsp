<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>상품 등록</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cateArr1 = new Array();
	var cateObj1 = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].level == "1") {
	  cateObj1 = new Object();  //초기화
	  cateObj1.cateCode = jsonData[i].cateCode;
	  cateObj1.cateName = jsonData[i].cateName;
	  cateArr1.push(cateObj1);
	 }
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cateSelect1 = $("select.category1")

	for(var i = 0; i < cateArr1.length; i++) {
	 cateSelect1.append("<option value='" + cateArr1[i].cateCode + "'>"
	      + cateArr1[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){

		 var cateArr2 = new Array();
		 var cateObj2 = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {
		   cateObj2 = new Object();  //초기화
		   cateObj2.cateCode = jsonData[i].cateCode;
		   cateObj2.cateName = jsonData[i].cateName;
		   cateObj2.cateCodeRef = jsonData[i].cateCodeRef;
		   
		   cateArr2.push(cateObj2);
		  }
		 }
		 
		 var cateSelect2 = $("select.category2");
		 
		 cateSelect2.children().remove();

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();  
		  
		  cateSelect2.append("<option value='" + selectVal + "'>--</option>");
		  
		  for(var i = 0; i < cateArr2.length; i++) {
		   if(selectVal == cateArr2[i].cateCodeRef) {
		    cateSelect2.append("<option value='" + cateArr2[i].cateCode + "'>"
		         + cateArr2[i].cateName + "</option>");
		   }
		  }
		  
		 }); // option:selected
		 
	}); // document.change
	
	
	 // 취소 버튼 클릭시
	 $("#back_Btn").click(function(){
		  //history.back();
		  location.href = "/admin/goods/view?n=" + ${goods.goodsNum};
	 }); // #back_btn.click()
	 
	 
	 var select_cateCode = '${goods.cateCode}';
	 var select_cateCodeRef = '${goods.cateCodeRef}';
	 var select_cateName = '${goods.cateName}';
	 
	 if(select_cateCodeRef != null && select_cateCodeRef != '') {
		 $(".category1").val(select_cateCodeRef);
 		 $(".category2").val(select_cateCode);
		 $(".category2").children().remove();
		 $(".category2").append("<option value='"
		       + select_cateCode + "'>" + select_cateName + "</option>"); 
		} else {
		 $(".category1").val(select_cateCode);
		 //$(".category2").val(select_cateCode);
		 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
		 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
	}
	 
	// validation check : null
	var formObj = $("form[role='form']");
	
	$("#update_Btn").click(function() {
		if($(".category2").val() == null || $(".category2").val() == '') {
			alert('상품 분류를 선택해주세요.');
			return false;
		} 
		if($("#goodsName").val() == null || $("#goodsName").val().trim() == '') {
			alert('상품 이름을 입력해주세요.');
			return false;
		}
		if($("#goodsPrice").val() == null || $("#goodsPrice").val().trim() == '') {
			alert('상품 이름을 입력해주세요.');
			return false;
		}
		
		formObj.submit();
	});
	
	// validation check : number
	$("input:text[numberOnly]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
    });
}) // END
</script>

</head>
<body>
<div id="root">
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box" class="register_box">
			<h2 style="text-align:center;">상품 수정</h2>
			<hr style="margin-bottom: 2em;"/>
			<form role="form" method="post" autocomplete="off" id="register_form" enctype="multipart/form-data">
				<input type="hidden" name="goodsNum" value="${goods.goodsNum }" />
				
			 	<!-- 카테고리 -->
			 	<div id="category">
					<label>1차 분류</label>
					<select class="category1">
						<option value="">--</option>
					</select>
					<p style="margin-top:1.5em;"></p>
					<label>2차 분류</label>
					<select class="category2" name="cateCode">
						<option value="">--</option>
					</select>
				</div>
			 	
			 	<!-- 등록 -->
			 	<div class="inputArea">
			 		<label for="goodsName">상품명</label>
			 		<input type="text" id="goodsName" name="goodsName" value="${goods.goodsName }"/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsPrice">상품가격</label>
			 		<input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice }" numberOnly/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsStock">상품수량</label>
			 		<input type="text" id="goodsStock" name="goodsStock" value="${goods.goodsStock }" numberOnly/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsDesc">상품소개</label>
			 		<textarea rows="5" cols="50" id="goodsDesc" name="goodsDesc" >${goods.goodsDesc }</textarea>
			 	<script>
				 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "/admin/goods/ckUpload"
				 };
				 
				 CKEDITOR.replace("goodsDesc", ckeditor_config);
				</script>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsImg">이미지</label>
			 		<input type="file" id="goodsImg" name="file"  style="margin-bottom: 1em;"/>
			 		<div class="select_img">
			 			<img src="${goods.goodsImg }"/>
			 			<input type="hidden" name="goodsImg" value="${goods.goodsImg }" />
			 			<input type="hidden" name="goodsThumbImg" value="${goods.goodsThumbImg }" />
			 		</div>
			 	</div>
			 	<script>
			 		// 파일이 등록되면 현재 화면에서 어떤 이미지인지 볼 수 있게 해주는 역할
			 		$('#goodsImg').change(function() {
			 			if(this.files && this.files[0]) {
			 				var reader = new FileReader;
			 				reader.onload = function(data) {
			 					$(".select_img img").attr("src", data.target.result).width(500);
			 				}
			 				reader.readAsDataURL(this.files[0]);
			 			}
			 		});
			 	</script>
			 	<div class="btnArea">
			 		<button type="button" id="update_Btn">완료</button>
			 		<button type="button" id="back_Btn">취소</button>
			 	</div>
			</form>
		</div>
	</section>
</div>

<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
</html>