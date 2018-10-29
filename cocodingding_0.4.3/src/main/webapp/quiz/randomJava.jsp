<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>랜덤 - JAVA</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	<style>
		/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */
		/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */
		/* 작은 기기들 (태블릿, 768px 이상) */
		@media (min-width: @screen-sm-min) { ... }
		/* 중간 기기들 (데스크탑, 992px 이상) */
		@media (min-width: @screen-md-min) { ... }
		/* 큰 기기들 (큰 데스크탑, 1200px 이상) */
		@media (min-width: @screen-lg-min) { ... }
		
		/* 네비게이션 */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
			font-size: 20px;
			background-color: black;
		}
	    
	    /* 로우 컨텐트 */
		.row.content {
			height: 100%;
		}
	    
	    /* 바디 */
		body {
			padding-top: 50px;
		}
		
		/* 사이드 */
		.sidenav {
			padding-top: 20px;
			background-color: #f1f1f1;
			height: 100%;
		}
		
		/* 사용자 이미지 */
		.img-responsive {
			alt: sea; 
			width: 190; 
			height: 220;
		} 
		
		/* 작은화면 시, 높이는 'auto' 사이드바/그리드 */
		@media screen and (max-width: 767px) {
			.sidenav {
				height: auto;
				padding: 15px;
			}
			.row.content {
				height:auto;
			} 
		}
	</style>
	
</head>
<body>
	
	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<!-- 네비 로고 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>                        
				</button>
				<img class="" src="/qboard/resources/logo5.png">
			</div>
			<!-- 네비 로고 끝 -->
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 카테고리- -->
				<ul class="nav navbar-nav">
					<li><a href="/qboard/user.me/Java">나의 페이지</a></li>
					<li><a href="/qboard/diagn.qu">실력진단</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">JAVA<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/Java/0">랜덤 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/Java/1">레벨 선택 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/Java/2">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WEB<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/Web/0">랜덤 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/Web/1">레벨 선택 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/Web/2">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DataBase<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/DB/0">랜덤 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/DB/1">레벨 선택 테스트</a></li>
							<li><a href="/qboard/testPrep.qu/DB/2">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li><a href="">틀린문제</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="#">나의 블로그</a></li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				<!-- 네비 우측 -->
				<ul class="nav navbar-nav navbar-right">
				  <li><a href="/qboard/logoutPro.me"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
				</ul>
				<!-- 네비 끝 -->
			</div>
			<!-- 네비 중앙 끝 -->
		</div>
	</nav>
	<!-- 네비게이션 끝 -->
	
	<!-- 중앙 -->
	<div class="container">
		<div class="col-lg-1"></div>
		<!-- 본문 -->
		<div class="col-lg-10 text-left"> 
			<!-- 본문 랩. 감싸는부분 -->
			<div class="">
				<!-- 상단 -->
				<div class="">
					<h1>랜덤 테스트 - JAVA</h1>
					<hr>
					<h3>현재 레벨과 유사한 문제들을 알파고 동생 '코딩고'가 랜덤하게 제출 해줍니다.</h3>
					<br/>
				</div>
				<!-- 상단 끝 -->
				<!-- 하단 -->
				<div class="">
					<h4>랜덤 테스트의 특징</h4>
						<ol class="">
							<li><a>현 레벨과 비슷한 수준의 문제를 풀어볼 수 있습니다.</a></li>
							<li><a>시간제한이 없어 한가지 문제를 집중하여 풀어볼 수 있습니다.</a></li>
							<li><a>'장바구니' 기능을 통하여 나중에 다시 풀어 볼 수 있습니다.</a></li>
							<li><a>랜덤 테스트는 문제 수 제한이 없으므로 원하시는 만큼 문제를 풀어볼 수 있습니다.</a></li>
						</ol>	
					<br/>
					<h4>테스트 사전안내</h4>	
						<ol class="">
							<li><a>테스트의 시간제한은 없습니다.</a></li>
							<li><a>문제 출제는 현재 레벨과 비슷한 레벨로 진행됩니다. (*상위레벨 문제를 풀기위해서는 '레벨 업 테스트'가 진행되어야 합니다.)</a></li>
							<li><a>테스트 종료 후 풀어본 문제에 대한 '진단결과'페이지로 이동합니다.</a></li>
						</ol>	
					<br/>
					<div class="btn-group">
						<h3>버튼을 클릭하시면 테스트를 시작합니다.</h3>
						<button type="button" class="btn btn-default btn-lg" onclick="location.href='/qboard/study.qu/WEB/1/0'">자동문제 풀어보기</button>
						<br/>
					</div>
				</div>
				<!-- 하단 끝 -->
			</div>
			<!-- 본문 랩 끝 -->
		</div>
		<!-- 본문 끝 -->
		<div class="col-lg-1"></div>
	</div>
	<!-- 중앙 끝 -->
	
	<!-- 푸터 -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<p>Created by Coco Dingding</p>
		</div>
	</nav>
	<!-- 푸터 끝 -->

</body>
</html>
