<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#category_container {
		height: 50px;
		background: #f8f8f8;
	}
	ul.category_menu {
		width: 800px;
		margin: 0 auto;
	}
	ul.category_menu > li.menu_list {
		float: left;
		width: 100px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		position: relative;
	}
	li.menu_list:hover ul.sub_menu {
		display: block;
	}
	li.menu_list > a {
		display: block;
	}
	li.menu_list > ul.sub_menu {
		position: absolute;
		top: 50px;
		left: 0;
		width: 100%;
		display: none;
		background: #f8f8f8;
	}
	li.menu_list:hover ul.sub_menu {
	}
</style>
<div id="category_container">    
	<ul class="category_menu">
		 <li class="menu_list">
		 	<a href="/shop/list?c=100&l=1">책상</a>
		 	<ul class="sub_menu">
		 		<li><a href="/shop/list?c=101&l=2">일반책상</a></li>
		 		<li><a href="/shop/list?c=102&l=2">스탠딩책상</a></li>
		 		<li><a href="/shop/list?c=103&l=2">좌식책상</a></li>
		 	</ul>
		 </li>
		 <li class="menu_list">
		 	<a href="/shop/list?c=200&l=1">의자</a>
		 	<ul class="sub_menu">
		 		<li><a href="/shop/list?c=201&l=2">일반의자</a></li>
		 		<li><a href="/shop/list?c=202&l=2">사무용의자</a></li>
		 		<li><a href="/shop/list?c=203&l=2">게이밍의자</a></li>
		 		<li><a href="/shop/list?c=204&l=2">좌식의자</a></li>
		 		<li><a href="/shop/list?c=205&l=2">흔들의자</a></li>
		 	</ul>
		 </li>
		 <li class="menu_list"><a href="/shop/list?c=300&l=1">책장/북선반</a></li>
		 <li class="menu_list"><a href="/shop/list?c=400&l=1">서랍장/캐비넷</a></li>
		 <li class="menu_list">
		 	<a href="/shop/list?c=500&l=1">파티션/악세서리</a>
		 	<ul class="sub_menu">
		 		<li><a href="/shop/list?c=301&l=2">데스트매트/독서거치대</a></li>
		 		<li><a href="/shop/list?c=302&l=2">모니터받침대</a></li>
		 		<li><a href="/shop/list?c=303&l=2">발받침대</a></li>
		 		<li><a href="/shop/list?c=304&l=2">파티션/칸막이</a></li>
		 		<li><a href="/shop/list?c=305&l=2">보드/칠판/이젤</a></li>
		 	</ul>
		 </li>
	</ul>
</div>
