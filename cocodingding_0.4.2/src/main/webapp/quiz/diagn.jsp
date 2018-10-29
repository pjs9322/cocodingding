<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>실력진단 - 시작</title>
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
	<div class="container text-center">  
		<!-- 로우 컨텐트 -->
		<div class="row content">
		
			<!-- 왼쪽 사이드바 -->
			<div class="col-lg-2 sidenav">
				<!-- 사이드바 랩. 감싸는부분 -->
				<div class="">
					<!-- 사이드 사진 -->
					<div class="">
						<img class="img-responsive" src="/qboard/resources/user.jpg" > 
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${userInfo.nickname}님 환영합니다.</h4>
						<h4>JAVA LV.3</h4>
						<h4>WEB LV.3</h4>
						<h4>DataBase LV.3</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href = '/qboard/modForm.me'">회원정보수정</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/my'">나의 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/ask'">질문 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/all'">전체 게시판</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드바 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 중앙 본문 -->
			<div class="col-lg-10 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h2>실력진단 페이지</h2>
						<hr>
						<div class="alert alert-warning" role="alert">
							<p>본 페이지에서는 회원님의 실력을 진단하기 위한 페이지 입니다.</p>
							<p>실력진단은 회원가입 후 최초 1회만 진행되며, 실력진단 완료 후 다른 서비스를 이용가능하오니 반드시 실력진단을 진행해주시기 바랍니다.</p>
						</div>
					</div>
					<!-- 본문 상단 끝 -->
				
					<!-- 본문 하단 -->
					<div class="">
						<div class="">
							<h4>JAVA 실력진단 테스트</h4>
							<p>아래 버튼을 클릭하여 테스트를 진행해주세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg" onclick="location.href='/qboard/diagno.qu/JAVA/0'">JAVA 실력진단 테스트 시작하기</button>
							</div>
						</div>
						<br/>
						<hr>
						<div class="">
							<h4>WEB 실력진단 테스트</h4>
							<p>아래 버튼을 클릭하여 테스트를 진행해주세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg" onclick="location.href='/qboard/diagno.qu/WEB/0'">WEB 실력진단 테스트 시작하기</button>
							</div>
						</div>
						<br/>
						<hr>
						<div class="">
							<h4>DataBase 실력진단 테스트</h4>
							<p>아래 버튼을 클릭하여 테스트를 진행해주세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg" onclick="location.href='/qboard/diagno.qu/DataBase/0'">DataBase 실력진단 테스트 시작하기</button>
							</div>
						</div>
						<br/>
						<hr>
					</div>
					<!-- 본문 하단 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 중앙 본문 끝 -->
					
		</div>
		<!-- 로우 컨텐트 끝-->
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
