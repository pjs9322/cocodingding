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
  	
  	<!-- 자바스크립트 영역 -->
  	<script type="text/javascript">
  		// 사용자 계정 삭제 질문 폼
	  	function admin_userDelete(code) {
	  	    result = confirm('정말로 삭제 하시겠습니까');
	  	    if(result == true){
	  	        location.href = "/qboard/admin_delete.me/" + code;
	  	    }else{
	  	    	return false;
	  	    }
  		}
 	</script>
  	
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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		
			<!-- 네비 로고 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<!-- 네비 로고 끝 -->
			
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 카테고리- -->
				<ul class="nav navbar-nav">
				  <li class="active"><a href="#"></a></li>
				  <li><a href="/qboard/admin.me">회원관리</a></li>
				  <li><a href="/qboard/admin.qu">문제관리</a></li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				
				<!-- 네비 우측 -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/qboard/logoutPro.me"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li> 
				</ul>
				<!-- 네비 우측 끝 -->
			</div>
			<!-- 네비 중앙 끝 -->
			
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
						<h4>${userInfo.nickname}님 환영합니다.</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='/qboard/boardList.bo'">게시판 관리</button>
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
					<!-- 본문 게시판 -->
					<div class="">
						<h2>회원관리 게시판</h2>
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
								</div>
								<div id="write">
								</div>
								<div>
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th width="20%">ID</th>
												<th width="20%">비밀번호</th>
												<th width="10%">닉네임</th>
												<th width="30%">이메일</th>
												<th width="10%">수정</th>
												<th width="10%">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="article" items="${memberList}" varStatus="status">
												<tr>
												    <td>${article.id}</td>
												    <td>${article.password}</td>
												    <td>${article.nickname}</td>
												    <td>${article.email}</td>
													<c:set var="admin" value="${article.admin}" />
													<c:choose>
													    <c:when test="${admin eq 1}">
														    <td>관리자</td>
														    <td>삭제불가</td>
													    </c:when>
													    <c:otherwise>
														    <td><a href="/qboard/admin_modForm.me/${article.id}">수정</a></td>
														    <td><a href="#" onclick="admin_userDelete('${article.id}')">삭제</a></td>
													    </c:otherwise>
													</c:choose>
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
									<div class="btn-group">
										<button type="button" class="btn btn-default">분류</button>
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<span class="caret"></span>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">JAVA</a></li>
											<li><a href="#">WEB</a></li>
											<li><a href="#">DB</a></li>
										</ul>
									</div>
								</div>
								<!-- 게시판 분류 드롭다운 끝 -->
								<!-- 게시판 검색 란 -->
								<div class="col-lg-9">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search for...">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button">Go!</button>
										</span>
									</div>
								</div>
								<!-- 게시판 검색 란 끝 -->
							</div>
							<!-- 게시판 하단 끝 -->
			
					</div>
					<!-- 본문 게시판 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 본문 끝 -->
					
			<!-- 섹션 - 오른쪽 사이드바 -->
			<div class="col-lg-4 sidenav">
				<!-- 사이드 바 랩 . 감싸는부분-->
				<div class="">
					<!-- 사이드 페이지 기능-->
					<div class="">
						<h2>회원정보 수정</h2>
						<hr/>
						<!-- 사이드 정보수정-->
						<div class="">
							<form action="/qboard/admin_modPro.me" method="post">
								<div class="form-group">
									<label class="col-lg-6 control-label">선택된 사용자 ID :</label>
									<div class="col-lg-6">
										<p class="form-control-static">${member.id}</p>
									</div>
									<br/>
									<button type="button" class="btn btn-primary">프로필 사진 초기화</button>
								</div>
								<div class="form-group">
									<input type="hidden" name="id" value="${member.id}" required="required" >
									<input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" value="${member.password}" required="required" >
									<label for="password">※이메일 주소는 8자리 이상입니다.</label>
									<br/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" value="${member.nickname}" required="required" >
									<label for="nickname">※중복된 닉네임은 사용할 수 없습니다..</label>
									<br/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요" value="${member.email}" required="required" >
									<label for="email">※중복된 이메일은 사용할 수 없습니다.</label>
									<br/>
								</div>
								
								<button type="submit" class="btn btn-primary">정보수정</button>
								<button type="reset" class="btn btn-default">취소</button>
							</form>
						</div>
						<!-- 사이드 정보수정 끝 -->
					</div>
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
	<footer class="container-fluid text-center">
		<p>Created by Coco Dingding</p>
	</footer>

</body>
</html>
