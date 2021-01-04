<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		 
		 cateSelect2.children().remove();

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();  
		  
		  cateSelect2.append("<option value='" + selectVal + "'>전체</option>");
		  
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
}) // END
</script>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<h2>상품 수정</h2>
			
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" name="goodsNum" value="${goods.goodsNum }" />
			
			 	<!-- 카테고리 -->
				<label>1차 분류</label>
				<select class="category1">
					<option value="">전체</option>
				</select>
				
				<label>2차 분류</label>
				<select class="category2" name="cateCode">
					<option value="">전체</option>
				</select>
			 	
			 	<!-- 등록 -->
			 	<div class="inputArea">
			 		<label for="goodsName">상품명</label>
			 		<input type="text" id="goodsName" name="goodsName" value="${goods.goodsName }"/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsPrice">상품가격</label>
			 		<input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice }"/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsStock">상품수량</label>
			 		<input type="text" id="goodsStock" name="goodsStock" value="${goods.goodsStock }"/>
			 	</div>
			 	<div class="inputArea">
			 		<label for="goodsDesc">상품소개</label>
			 		<input type="text" id="goodsDesc" name="goodsDesc" value="${goods.goodsDesc }" />
			 	</div>
			 	
			 	<div class="inputArea">
			 		<button type="Submit" id="update_Btn">완료</button>
			 		<button type="button" id="back_Btn">취소</button>
			 	</div>
			</form>
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>
</html>