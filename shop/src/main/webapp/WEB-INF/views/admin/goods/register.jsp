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
			 
			 /*
			 for(var i = 0; i < cate2Arr.length; i++) {
			   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			        + cate2Arr[i].cateName + "</option>");
			 }
			 */
			 
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
			 
		}); // document.on
		
		// validation check : null
		var formObj = $("form[role='form']");
		
		$("#register_Btn").click(function() {
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
			<h2 style="text-align: center;">상품 등록</h2>
			<hr style="margin-bottom: 2em;"/>
			<form role="form" method="post" autocomplete="off" id="register_form" enctype="multipart/form-data">
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
			 		<label for="goodsName">상품 이름</label>
			 		<input type="text" id="goodsName" name="goodsName" />
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsPrice">상품 가격</label>
			 		<input type="text" id="goodsPrice" name="goodsPrice" numberOnly/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsStock">상품 수량</label>
			 		<input type="text" id="goodsStock" name="goodsStock" numberOnly/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsDesc">상품 소개</label>
			 		<input type="text" id="goodsDesc" name="goodsDesc" />
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsImg">이미지</label>
			 		<input type="file" id="goodsImg" name="file" />
			 		<div class="select_img"><img src="" style="margin-top: 1em;"/></div>
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
			 	<%=request.getRealPath("/") %>
			 	<div class="btnArea">
			 		<button type="button" id="register_Btn">등록</button>
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
</body>
</html>