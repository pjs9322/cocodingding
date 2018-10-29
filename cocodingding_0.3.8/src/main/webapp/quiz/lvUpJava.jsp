<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="utf-8">
<head>

	<title>Bootstrap Example</title>
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
		
		body {
			position: relative; 
		}
		
	    /* 네비게이션 */
	    .navbar {
			margin-bottom: 0;
			border-radius: 0;
			background: green;
	    }
	    
	    /* 푸터 */
	    footer {
			background-color: #555;
			color: white;
			padding: 15px;
	    }
	</style>
	
</head>
<body>
	
	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		
			<!-- 네비 로고 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="#">Logo 자리</a>
			</div>
			<!-- 네비 로고 끝 -->
			
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 - 카테고리- -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="/qboard/user.me/Java">나의 페이지</a></li>
					<li><a href="/qboard/diagn.qu">실력진단</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">JAVA<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/Java/0">문제풀기</a></li>
							<li><a href="/qboard/testPrep.qu/Java/1">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WEB<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/Web/0">문제풀기</a></li>
							<li><a href="/qboard/testPrep.qu/Web/1">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DataBase<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/qboard/testPrep.qu/DB/0">문제풀기</a></li>
							<li><a href="/qboard/testPrep.qu/DB/1">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li><a href="">틀린문제</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="#">나의 블로그</a></li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				
				<!-- 네비 - 우측 -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/qboard/logoutPro.me"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li> 
				</ul>
				<!-- 네비 우측 끝 -->
			</div>
		</div>
	</nav>
	<!-- 네비게이션 끝 -->
	
	<!-- 섹션 -->
	<div id="section" class="container">
		<!-- 섹션 중앙 -->
		<div class="col-lg-12 text-left"> 
			<!-- 중앙 랩. 감싸는부분 -->
			<div class="">
				<!-- 상단 -->
				<div class="">
					<h1>JAVA Test - Level up</h1>
					<hr>
					<h3>현 레벨보다 상위레벨로 나아가기 위한 테스트입니다.</h3>
					<h5>'레벨 업 테스트'의 결과는 '랜덤 테스트'와 '레벨선택 테스트'에 반영됩니다.</h5>
					<br/>
				</div>
				<!-- 상단 끝 -->
				<!-- 하단 -->
				<div class="">
					<h4>테스트 사전안내</h4>	
						<ol class="">
							<li><a href="">문항 수는 총 10문항 입니다.</a></li>
							<li><a href="">시간제한이 30분으로 설정됩니다.</a></li>
							<li><a href="">달성한 최고 레벨에 해당하는 문제들로 구성됩니다.</a></li>
							<li><a href="">정답률 60% 이상 달성 시 레벨 업이 가능합니다.</a></li>
							<li><a href="">레벨 업 실패 시 재시도가 가능합니다.</a></li>
							<li><a href="">레벨 업 테스트 종료 후 결과페이지로 이동합니다.</a></li>
						</ol>	
					<br/>
					<div class="btn-group">
						<h3>버튼을 클릭하시면 테스트를 시작합니다.</h3>
						<button type="button" class="btn btn-default btn-lg" onclick="location.href='/qboard/levelUp.qu/JAVA/0'">레벨 업 테스트 시작</button>
						<br/>
					</div>
				</div>
				<!-- 하단 끝 -->
			</div>
			<!-- 중앙 랩 끝 -->
		</div>
		<!-- 섹션 중앙 끝 -->
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center">
		<p>Created by Coco Dingding</p>
	</footer>

</body>
</html>

