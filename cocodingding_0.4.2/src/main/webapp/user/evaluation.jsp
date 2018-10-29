<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>테스트 결과</title>
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
	    
	   	/* 게시판 설정 http://bigfat.tistory.com/80 */
	    #container {
	      width: 100%;
	      margin: 0 auto;     /* 가로로 중앙에 배치 */
	      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
	    }
	     
	    #list {
	      text-align: center;
	    }
	   
	    #write {
	      text-align: right;
	    }
	     
	    /* Bootstrap 수정 */
	    .table > thead {
	      background-color: #b3c6ff;
	    }
	    .table > thead > tr > th {
	      text-align: center;
	    }
	    .table-hover > tbody > tr:hover {
	      background-color: #e6ecff;
	    }
	    .table > tbody > tr > td {
	      text-align: center;
	    }
	    .table > tbody > tr > #title {
	      text-align: left;
	    }
	     
	    div > #paging {
	      text-align: center;
	    }
	     
	    .hit {
	      animation-name: blink;
	      animation-duration: 1.5s;
	      animation-timing-function: ease;
	      animation-iteration-count: infinite;
	      /* 위 속성들을 한 줄로 표기하기 */
	      /* -webkit-animation: blink 1.5s ease infinite; */
	    }
	     
	    /* 애니메이션 지점 설정하기 */
	    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
	    @keyframes blink {
	      from {color: white;}
	      30% {color: yellow;}
	      to {color: red; font-weight: bold;}
	      /* 0% {color:white;}
	      30% {color: yellow;}
	      100% {color:red; font-weight: bold;} */
	    }
	    /* 게시판 설정 끝*/
	    
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
			<div class="col-lg-4 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 결과 -->
					<div class="">
						<h2>테스트 진단결과</h2>
							<c:if test="${testType eq '레벨 업 테스트'}">
							<h4>박준성 님은 레벨 업 에 ${success}하셨습니다.</h4>
							<h4>박준성 님은 현재 ${field} ${levels} 입니다.</h4>
							<h4>프로그래밍 언어 ${step} 단계입니다.</h4>
							<hr>
							</c:if>
						<!-- 진단 내역 -->
						<div class="row">
							<div class="border col-lg-12">
								<h3>박준성 님의 ${field} ${testType} 결과</h3>
								<h5>진단일자 : ${date}</h5>
								<br/>
								<h4>총 ${total} 문항 중 ${correct} 문항을 맞추셨습니다.</h4>
								<h5>${evalText1}으로 각 개념을 이해할 수 있습니다.</h5>
								<h5>${evalText1}으로 코드를 작성 할 수 있습니다.</h5>
								<h5>${evalText1}으로 응용이 가능합니다.</h5>
							</div>
							<div class="border col-lg-12">
								<h3>코딩고 종합평가</h3>
								<h5>각 파트 별 ${evalText2} 요구 됩니다.</h5>
								<h5>각 파트 별 ${evalText2} 요구 됩니다.</h5>
							</div>
						</div>
						<!-- 진단 내역 끝 -->
					</div>
					<!-- 결과 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 본문 끝 -->
					
			<!-- 오른쪽 사이드바 -->
			<div class="col-lg-6 sidenav">
				<!-- 사이드바 랩 . 감싸는부분-->
				<div class="">
					<!-- 사이드 페이지 기능-->
					<div class="">
						<h2>정답/오답 확인</h2>
						<!-- 사이드 게시판 -->	
						<div id="container">
							<div align="right">
								<!-- Login 검증 -->
								<!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
								<c:if test="${id != null}">
									<%-- <%@include file="loginOk.jsp" %> --%>
								</c:if>
								<c:if test="${id == null}">
									<%-- <%@include file="login.jsp" %> --%>
								</c:if>
							</div>
							<div id="list">
								<b>게시판 (전체 글: ${totalCount})</b>
							</div>
							<div id="write">
								<a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
							</div>
							<div>
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th width="20%">번호</th>
											<th width="30%">제목</th>
											<th width="20%">작성자</th>
											<th width="15%">작성일</th>
											<th width="15%">조회</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="article" items="${articles}" varStatus="status">
											<tr>
												<td>${article.articleNumber}</td>
												<td id="title">
													<c:if test="${article.depth > 0}">
														&nbsp;&nbsp;
													</c:if>
													<a href="/bbs/content.bbs?articleNumber=${article.articleNumber}&pageNum=${pageNum}">${article.title}</a>
													<c:if test="${article.hit >= 20}">
														<span class="hit">hit!</span>
													</c:if>
												</td>
												<td>${article.id}</td>
												<td>${article.writeDate}</td>
												<td>${article.hit}</td>
												<tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- 게시판 하단 -->
							<div class="">
								<!-- 게시판 하단 페이지네이션 -->
								<nav>
									<ul class="pagination">
										<li>
											<a href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
											</li>
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
											<li>
											<a href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
								</nav>
								<!-- 게시판 하단 페이지네이션 끝 -->
								<!-- 게시판 분류 드롭다운 -->
								<div class="col-lg-3">
									<div class="">
										<select class="form-control" name="field" required="required">
											<option <c:if test="${article.field eq 'JAVA'}">selected</c:if>>JAVA</option>
											<option <c:if test="${article.field eq 'WEB'}">selected</c:if>>WEB</option>
											<option <c:if test="${article.field eq 'DataBase'}">selected</c:if>>DataBase</option>
										</select>
									</div>
								</div>
								<!-- 게시판 분류 드롭다운 끝 -->
								<!-- 게시판 검색 란 -->
								<div class="col-lg-9">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="내용을 입력하세요">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button">검색</button>
										</span>
									</div>
								</div>
								<!-- 게시판 검색 란 끝 -->
							</div>
							<!-- 게시판 하단 끝 -->
						</div>	
						<!-- 사이드 게시판 끝 -->
					
					<!-- 사이드 페이지 기능 끝 -->
				</div>
				<!-- 사이드바 랩 끝 -->
			</div>
			<!-- 오른쪽 사이드 끝 -->
			
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 섹션 끝 -->
	
	<!-- 푸터 -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<p>Created by Coco Dingding</p>
		</div>
	</nav>
	<!-- 푸터 끝 -->

</body>
</html>
