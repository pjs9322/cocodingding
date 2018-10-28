<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>관리자 페이지</title>
	<!-- jQuery사용 -->
	<script type="text/javascript" src="/qboard/resources/script.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
	<!-- 1. 네비게이션 나열하기(그림자) -->
	<script>
		$(document).ready(function (){
			$('.outer-menu-item').hover(function () {
				/*$(this).find('.inner-menu').show();*/
			}, function () {
				$(this).find('.inner-menu').hide();
			});
		});	
	</script>
	
	<!-- 스타일 구성 -->
	<!-- 초기화 -->
	<style>
		* {
			margin: 0; padding: 0;
			font-family: '맑은 고딕', 'Malgun Gothic', Gothic, sans-serif;
		}
		
		a { text-decoration: none;}
		li { list-style: none;}
	</style>
	
	<!-- 기본 클래스 -->
	<style>
		.pull-left {float: left;}
		.pull-right {float: right;}
	</style>
	
	<!-- 2. 페이지 구성 -->
	<style>
		body{
			width: 1200px; margin: 0 auto;
			background: black;
		}
		#page-wrapper {
			background: white;
			margin: 40px 0; padding: 10px 20px;
			border-radius: 0px;
			box-shadow: 0 2px 6px rgba(100, 100, 100, 0.3);
		}
	</style>

	<!-- 3. 헤더 구성 -->
	<style>
		#main-header { 
			padding: 10px 50px;
			background: #96ddff;
			border-radius: 15px;
		}
		.master-title {
			font-size: 40px;
			color: black;
			text-align: right;
		}
		.master-description {	
			font-size: 20px;
			font-weight: 500;
			padding-left: 10px;
			color: #adadad;
			text-align: right;
		}
	</style>

	<!-- 4. 내비게이션 및 풀다운 구성 -->
	<style>
		#main-navigation {
			border-bottom: 3px solid #C8C8C8;
			margin-bottom: 20px;
			height: 60px;
			position: center;
		}
		
		.outer-menu-align {
			width: 240px;
			height: 50px;
			background-color: #4286f4;
			color: white;
			text-align: center;
			margin: auto;
		}
		
		.outer-menu-item {
			float: left;
			position: relative;
		}
		
		.outer-menu-item:hover {
			background: #263ce2;
			color: white
		}
		
		.menu-title {
			display: block;
			height: 50px;
			line-height: 30px;
			text-align: center;
			padding: 5px 20px;
			font-size: 20px;
		}
		
		.inner-menu {
			display: none;
			position: absolute;
			top: 40px; left: 0;
			width: 100%;
			
			background: white;
			box-shadow: 0 2px 6px rgba(5, 5, 5, 0.9);
			z-index: 1000;
			
			text-align: center
		}
		
		.inner-menu-item > a {
			display: block;
			padding: 5px 10px;
			color: black
		}
		
		.inner-menu-item > a:hover {
			background: #050eb2;
			color: white;
		}
	</style>
	
	<!-- 5. 본문 추가(중앙 내용) -->
	<style>
		/*body 태그의 너비: 1500px*/
		#content {overflow: hidden;}
		
		#main-section {
			float: right;
			width: 900px;
		}
		
		#main-aside {
			float: left;
			width: 250px;
		}
	</style>
	
	<!-- 6.본문 추가(사이드 메뉴) -->
	<style>
		.aside-list { 
			margin: 10px 10px 10px 10px;
			background: #96ddff;
			width: 190px;
			border-radius: 15px;
			padding: 20px;
		}
			
		#aside-pic {
			width: 190px;
			height: 220px;
		}
		
		.aside-welcome {
			margin: 10px;
		}
		
		.aside-menu {
		}
		
		.aside-menu-notice{
			border-radius: 15px;
			background: #4286f4;
			color: white;
			font-size: 25px;
			text-align: center;
			padding: 15px;
		}
	</style>
	
	<!-- 7.본문 추가(본문 포스트 상단) -->
	<style>
		.article {
			padding: 0 10px 20px 10px;
			border-bottom: 1px solid #C8C8C8;
			margin: 0 30px 0 20px;
		}
		
		.article-header {
			padding: 10px;
		}
		
		.article-title {
			font-size: 30px;
			font-weight: 500;
			padding-left: 10px;
			padding-bottom: 10px;
			border-radius: 10px;
			color: white;
			background: #4286f4;
		}
		
		.article-date {
			font-size: 20px;
			padding-left: 10px;
		}
			
		.article-body {
			font-size: 15px;
			padding-left: 10px;
		}
	</style>
	
	<!-- 8. 푸터 -->
	<style>
		#main-footer {
			font-size: 20px;
			text-align: right;
		}
	</style>
	
</head>

<body> 
<div id="page-wrapper">
	
		<!-- 헤더 -->
		<header id="main-header">
			<hgroup>
				<h1 class="master-title">logo</h1>
				<h2 class="master-description">Coco Dingding</h2>
			</hgroup>
		</header>
		
		<!-- 네비게이션 -->
		<nav id="main-navigation">
			<div class="outer-menu-align"><!-- 왼쪽정렬 -->
				<ul class="outer-menu"><!-- 메뉴 -->
					<li class="outer-menu-item"><!-- HTML5 메뉴 -->
						<span class="menu-title">실력진단</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="#">데이터1</a></li>
							<li class="inner-menu-item"><a href="#">데이터2</a></li>
							<li class="inner-menu-item"><a href="#">데이터3</a></li>
						</ul>
					</li>
					<li class="outer-menu-item"><!-- CSS3 메뉴 -->
						<span class="menu-title">자동학습</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="#">데이터1</a></li>
							<li class="inner-menu-item"><a href="#">데이터2</a></li>
							<li class="inner-menu-item"><a href="#">데이터3</a></li>
						</ul>
					</li>
					<li class="outer-menu-item"><!-- CSS3 메뉴 -->
						<span class="menu-title">레벨업 테스트</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="#">데이터1</a></li>
							<li class="inner-menu-item"><a href="#">데이터2</a></li>
							<li class="inner-menu-item"><a href="#">데이터3</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		
		<!-- 섹션 -->
		<div id="content">
			<section id="main-aside"><!-- 본문 사이드 -->
				<div class="aside-list">
					<div id="aside-pic">
						<img src="./resources/admin.png" alt="짤림"/>
					</div>
					<div class="aside-welcome">
						<h4>${userInfo.nickname} 님 환영합니다.</h4>
					</div>
					<div class="aside-menu">
						<input type="button" value="정보수정" onclick="location.href = '/qboard/modForm.me'">
						<input type="button" value="로그아웃" onclick="location.href = '/qboard/logoutPro.me'">
					</div>
					<br/><br/>
						<div class="aside-menu-notice" onclick="location.href = '/qboard/boardList.bo'">
							게시판 관리
						</div>
				</div>
			</section>
			<section id="main-section"><!-- 본문 중앙 -->
				<article>
					<div class="article-header">
					</div>
					<div class="article-body">
					</div>
				</article>
			</section>
		</div>
		
		<!-- 푸터 -->
		<footer id="main-footer">
			<a href="#">Created by Coco Dingding</a>
		</footer>
	
	</div>
</body> 
</html>
