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
		
	    /* 네비게이션 */
	    .navbar {
			margin-bottom: 0;
			border-radius: 0;
			background: green;
	    }
	    
	    /* 로우 컨텐트 */
	    .row.content {
	    	height: 750px;
	    	background: yellow;
	    }
	    
	    /* 레프트 사이드 */
	    .sidenav {
			padding-top: 20px;
			background-color: #f1f1f1;
			height: 100%;
			background: orange;
	    }
	    
	    /* 사용자 이미지 */
	    .img-responsive {
			alt: sea; 
			width: 190; 
			height: 220;
	    } 
	    
	    /* 푸터 */
	    footer {
			background-color: #555;
			color: white;
			padding: 15px;
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
					<li class="active"><a href="#">나의 페이지</a></li>
					<li><a href="#">실력진단</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">JAVA<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WEB<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DataBase<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li><a href="">틀린문제</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="#">나의 블로그</a></li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				
				<!-- 네비 - 우측 -->
				<ul class="nav navbar-nav navbar-right">
				  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
				<!-- 네비 우측 끝 -->
			</div>
		</div>
	</nav>
	<!-- 네비게이션 끝 -->
	
	<!-- 섹션 -->
	<div class="container text-center">  
		<!-- 로우 컨텐트 -->
		<div class="row content">
		
			<!-- 왼쪽 사이드바 -->
			<div class="col-lg-2 sidenav">
				<!-- 사이드 랩. 감싸는부분 -->
				<div class="">				
					<!-- 사이드 사진 -->
					<div class="">
						<img class="img-responsive" src="./resources/admin.png" > 
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>박준성님 환영합니다.</h4>
						<h4>JAVA LV.3</h4>
						<h4>WEB LV.3</h4>
						<h4>DataBase LV.3</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-primary btn-lg btn-block">회원정보수정</button>
						<button type="button" class="btn btn-default btn-lg btn-block">나의 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block">질문 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block">전체 게시판</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 섹션 본문 -->
			<div class="col-lg-10 text-left"> 
				<!-- 본문상단 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h2>레벨 업 테스트 결과페이지</h2>
						<p>이 페이지에서는 지금까지 진행했던 레벨 업 테스트의 결과를 다시 볼 수 있습니다.</p>
						<hr>
					</div>
					<!-- 본문 상단 끝 -->
				
					<!-- 본문 하단 -->
					<div class="">
						<div class="">
							<h3>JAVA 레벨 업 테스트 리스트</h3>
							<p>아래 버튼을 클릭하여 결과를 확인하세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 1</button>
								<button type="button" class="btn btn-default btn-lg">level 2</button>
								<button type="button" class="btn btn-default btn-lg">level 3</button>
								<button type="button" class="btn btn-default btn-lg">level 4</button>
								<button type="button" class="btn btn-default btn-lg">level 5</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 6</button>
								<button type="button" class="btn btn-default btn-lg">level 7</button>
								<button type="button" class="btn btn-default btn-lg">level 8</button>
								<button type="button" class="btn btn-default btn-lg">level 9</button>
								<button type="button" class="btn btn-default btn-lg">level 10</button>
							</div>
						</div>
						<br/>
						<hr>
						<div class="">
							<h3>WEB 레벨 업 테스트 리스트</h3>
							<p>아래 버튼을 클릭하여 결과를 확인하세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 1</button>
								<button type="button" class="btn btn-default btn-lg">level 2</button>
								<button type="button" class="btn btn-default btn-lg">level 3</button>
								<button type="button" class="btn btn-default btn-lg">level 4</button>
								<button type="button" class="btn btn-default btn-lg">level 5</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 6</button>
								<button type="button" class="btn btn-default btn-lg">level 7</button>
								<button type="button" class="btn btn-default btn-lg">level 8</button>
								<button type="button" class="btn btn-default btn-lg">level 9</button>
								<button type="button" class="btn btn-default btn-lg">level 10</button>
							</div>
						</div>
						<br/>
						<hr>
						<div class="">
							<h3>DataBase 레벨 업 테스트 리스트</h3>
							<p>아래 버튼을 클릭하여 결과를 확인하세요.</p>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 1</button>
								<button type="button" class="btn btn-default btn-lg">level 2</button>
								<button type="button" class="btn btn-default btn-lg">level 3</button>
								<button type="button" class="btn btn-default btn-lg">level 4</button>
								<button type="button" class="btn btn-default btn-lg">level 5</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg">level 6</button>
								<button type="button" class="btn btn-default btn-lg">level 7</button>
								<button type="button" class="btn btn-default btn-lg">level 8</button>
								<button type="button" class="btn btn-default btn-lg">level 9</button>
								<button type="button" class="btn btn-default btn-lg">level 10</button>
							</div>
						</div>
						<br/>
						<hr>
					</div>
					<!-- 본문 하단 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 본문 끝 -->
					
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 섹션 끝 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center">
		<p>Created by Coco Dingding</p>
	</footer>

</body>
</html>
