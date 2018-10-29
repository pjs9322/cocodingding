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
	
	<!-- 레이더차트 설정 -->
    <script src="/qboard/resources/radar.js"></script>
    
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
						<img class="img-responsive" src="/qboard/resources/admin.png" > 
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
			<div class="col-lg-6 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h1>내 학습현황</h1>
							<p>이 란은 아직 어떤 내용을 넣어야 할지 몰라 일단 만들어 놓은 부분.</p>
							<p>이 란은 아직 어떤 내용을 넣어야 할지 몰라 일단 만들어 놓은 부분.</p>
							<p>이 란은 아직 어떤 내용을 넣어야 할지 몰라 일단 만들어 놓은 부분.</p>
							<p>이 란은 아직 어떤 내용을 넣어야 할지 몰라 일단 만들어 놓은 부분.</p>
							<hr>
					</div>
					<!-- 본문 상단 끝 -->
				
					<!-- 본문 하단 -->
					<div class="col-lg-12">
						<h3>회원님의 자바 학습상태 그래프 입니다.</h3>
							<p>회원님의 파트별 레벨을 보여줍니다.</p>
							<p>회원 평균 레벨.</p>
						<!-- 하단 왼쪽 -->
						<div class="col-lg-7">
							<!-- 하단 레이더차트 -->
							<div id="microservices">
							</div>
								<script>
								radar.show('#microservices', {
								  size: 300,
								  curve: false,
								  metrics: [
								    {
								      name: "Part 1",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 3,
								      actual: 2
								    },
								    {
								      name: "Part 2",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 4,
								      actual: 3.5
								    },
								    {
								      name: "Part 3",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 3,
								      actual: 3.5
								    },
								    {
								      name: "Part 4",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 3.5,
								      actual: 3
								    },
								    {
								      name: "Part 5",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 3,
								      actual: 2.5
								    },
								    {
								      name: "Part 6",
								      range: [
								        "Lv. 2",
								        "Lv. 4",
								        "Lv. 6",
								        "Lv. 8",
								        "Lv. 10"
								      ],
								      target: 2.5,
								      actual: 2
								    }
								  ]
								});
								</script>
								<!-- 레이더 끝 -->
						</div>
						<!-- 하단 왼쪽 끝 -->
						<!-- 하단 오른쪽 -->
						<div class="col-lg-5">
							<p>차트 옆 공백이라 비워둠. 이 공백에 어떤 내용이든 쓰면 좋을듯</p>
							<p>차트 옆 공백이라 비워둠. 이 공백에 어떤 내용이든 쓰면 좋을듯</p>
							<p>차트 옆 공백이라 비워둠. 이 공백에 어떤 내용이든 쓰면 좋을듯</p>
							<p>차트 옆 공백이라 비워둠. 이 공백에 어떤 내용이든 쓰면 좋을듯</p>
							<p>차트 옆 공백이라 비워둠. 이 공백에 어떤 내용이든 쓰면 좋을듯</p>
						</div>
						<!-- 하단 오른쪽 끝 -->
					</div>
					<!-- 본문 하단 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 본문 끝 -->
					
			<!-- 섹션 - 오른쪽 사이드바 -->
			<div class="col-lg-4 sidenav">
				<!-- 사이드 바 랩 . 감싸는부분-->
				<div class="">
					<!-- 분야/레벨 선택-->
					<div class="">
						<h3>레벨 선택 표</h3>
							<p>해당 분야의 레벨을 선택하시면 파트별 레벨을 확인하실 수 있습니다.</p>
							<h5>레벨을 선택해주세요.</h5>
						<div class="row">
							<div class="col-lg-4">
								<button type="button" class="btn btn-primary btn-block">JAVA</button>
							</div>
							<div class="col-lg-8">
								<select class="form-control">
									<option>Lv 1</option>
									<option>Lv 2</option>
									<option>Lv 3</option>
									<option>Lv 4</option>
									<option>Lv 5</option>
									<option>Lv 6</option>
									<option>Lv 7</option>
									<option>Lv 8</option>
									<option>Lv 9</option>
									<option>Lv 10</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<button type="button" class="btn btn-primary btn-block">WEB</button>
							</div>
							<div class="col-lg-8">
								<select class="form-control">
									<option>Lv 1</option>
									<option>Lv 2</option>
									<option>Lv 3</option>
									<option>Lv 4</option>
									<option>Lv 5</option>
									<option>Lv 6</option>
									<option>Lv 7</option>
									<option>Lv 8</option>
									<option>Lv 9</option>
									<option>Lv 10</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<button type="button" class="btn btn-primary btn-block">DataBase</button>
							</div>
							<div class="col-lg-8">
								<select class="form-control">
									<option>Lv 1</option>
									<option>Lv 2</option>
									<option>Lv 3</option>
									<option>Lv 4</option>
									<option>Lv 5</option>
									<option>Lv 6</option>
									<option>Lv 7</option>
									<option>Lv 8</option>
									<option>Lv 9</option>
									<option>Lv 10</option>
								</select>
							</div>
						</div>
					</div>
					<!-- 분야/레벨 선택 끝 -->
			
					<!-- 파트 레벨 테이블 -->
					<div class="">
						<h3>실력테이블 Table</h3>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>Part</th>
									<th>My level</th>
									<th>Average</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Part 1</td>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Part 2</td>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Part 3</td>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Part 4</td>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Part 5</td>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Part 6</td>
									<td>2</td>
									<td>5</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 파트 레벨 테이블 끝 -->
				</div>
				<!-- 사이드 바 랩 끝 -->
			</div>
			<!-- 오른쪽 사이드 끝 -->
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