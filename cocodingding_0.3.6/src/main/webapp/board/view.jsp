<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="utf-8">
<head>

	<title>게시판 - 상세보기</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  	<!-- 자바스크립트 영역 -->
  	<script type="text/javascript">
  		// 문제 삭제 질문 폼
	  	function board_Delete(code) {
	  	    result = confirm('정말로 삭제 하시겠습니까');
	  	    if(result == true){
	  	        location.href = "/qboard/boardDelete.bo/" + code;
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
	    }
	    
	    body {
	    	padding-top: 50px;
	    }
	    
	    /* 로우 컨텐트 */
	    .row.content {
	    	height: 750px;
	    	background: yellow;
	    }
	    
	    /* 사이드 */
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
	    
	    /* 게시판 - 뷰 설정*/
	    #articleForm {
			width: 800px;
			height: 600px;
			border: 1px solid red;
			margin: auto;
		}

		#basicInfoArea {
			height: 40px;
			text-align: center;
		}
		
		#articleContentArea {
			background: orange;
			margin-top: 20px;
			height: 350px;
			text-align: center;
			overflow: auto;
		}
		
		#commandList {
			margin: auto;
			width: 500px;
			text-align: center;
		}
		/* 게시판 - 뷰 설정 끝*/
	    
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
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 본문 -->
			<div class="col-lg-10 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h2>게시판 페이지 - 상세보기</h2>
						<h4>궁금한 내용은 질문게시판을 이용하세요!</h4>
						<hr/>
					</div>
					<!-- 본문 상단 끝 -->
					
					<!-- 본문 게시판 -->
					<div id="container">
						<!-- 게시판 상세보기 -->
						<section id="articleForm">
							<section id="basicInfoArea">
								제 목 : ${article.title}
							</section>
							<section id="articleContentArea">
								${article.document}
							</section>
							<section id="commentsArea">
								<form action="/qboard/replyInsert.bo/${bnum}" method="post" name="replyform">
									<table>
										<c:forEach var="item" items="${replylist}">
											<tr>
												<td>${item.nickname}</td>
												<td>${item.document}</td>
												<td>${item.bdate}</td>
												<td><a href="/qboard/replyDelete.bo/${bnum}/${item.rnum}">[삭제]</a></td>
											</tr>
										</c:forEach>
										<tr class="col-lg-4">
											<td><h4>댓글 작성하기</h4></td>
										<tr/>
										<tr class="col-lg-8">
											<td>
												<input type="hidden" name="id" value="${userInfo.id}" required="required" readonly>
												<input type="text" name=nickname value="${userInfo.nickname}" required="required" readonly>
											</td>
											<td colspan="2">
												<textarea name="document" cols="30" rows="1"  required="required"></textarea>
											</td>
											<td>
												<input type="submit" value="등록">
											</td>
										</tr>
									</table>
								</form>
							</section>
							<section id="commandList">
								<input type="button" value="수정하기" onclick="location.href='/qboard/boardModifyForm.bo/${bnum}'">
								<input type="button" value="삭제하기" onclick="board_Delete('${bnum}')">
								<input type="button" value="목록으로 돌아가기" onclick="location.href='/qboard/boardList.bo/${type}'">
							</section>	
						</section>
						<!-- 게시판 상세보기 끝 -->	
					
					</div>
					<!-- 본문 게시판 끝 -->
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