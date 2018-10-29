<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="utf-8">
<head>

	<title>게시판 - 수정하기</title>
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
			
		/* 게시판 설정*/
		input[type=text]:disabled {
			background: #ffffff;
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
						<h2>게시판 페이지 - 수정하기</h2>
						<hr/>
					</div>
					<!-- 본문 상단 끝 -->
					
					<!-- 본문 게시판 -->
					<div class="">
						<!-- 게시판 글쓰기 -->
						<div class="writeForm">
							<form action="/qboard/boardUpdate.bo/${bnum}" method="post" name="boardform">
								<!-- 게시판 본문 -->
								<div class="form-group row">
									<div class="col-lg-3 text-center">
										<h4>작성자</h4>
									</div>
									<div class="col-lg-8">
										<input type="hidden" name="id" value="${userInfo.id}" readOnly="readOnly" style="cursor:auto">
										<input type="text" class="form-control" name="nickname" value="${userInfo.nickname}" readOnly="readOnly" style="cursor:auto">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-3 text-center">
										<h4>분&nbsp;&nbsp;&nbsp;&nbsp;야</h4>
									</div>
									<div class="col-lg-8">
										<select class="form-control" name="field" required="required">
											<option <c:if test="${article.field eq 'JAVA'}">selected</c:if>>JAVA</option>
											<option <c:if test="${article.field eq 'WEB'}">selected</c:if>>WEB</option>
											<option <c:if test="${article.field eq 'DataBase'}">selected</c:if>>DataBase</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-3 text-center">
										<h4>제&nbsp;&nbsp;&nbsp;&nbsp;목</h4>
									</div>
									<div class="col-lg-8">
										<input type="text" class="form-control" name="title" required="required" value="${article.title}">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-3 text-center">
										<h4>내&nbsp;&nbsp;&nbsp;&nbsp;용</h4>
									</div>
									<div class="col-lg-8">
										<textarea class="form-control col-lg-10"cols="60" rows="10" name="document" required="required">${article.document}</textarea>
									</div>
								</div>
								<!-- 게시판 본문 끝 -->
								
								<!-- 문제 추가하기 버튼 -->
								<div class="col-lg-12">
									<div class="col-lg-1"></div>
									<div class="alert alert-success col-lg-8" role="alert">
									  	문제 추가하기 버튼으로 틀린문제 및 장바구니 문제를 내용에 추가하여 게시 할 수 있습니다.
									</div>
									<button type="button" class="btn btn-success btn-lg center-block" data-toggle="modal" data-target="#makeQuiz">
										문제 추가하기
									</button>
								</div>
								<!-- 문제 추가하기 버튼 끝 -->
								
								<!-- 문제 추가하기 모달 -->
								<div class="modal fade" id="makeQuiz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<!-- 문제 추가 액션폼 -->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h2 class="modal-title" id="myModalLabel">문체 추가하기</h2>
											</div>
											<div class="modal-body">
												<div class="container-fluid">
													<div class="row">
														<div class="col-lg-12">
															<h3>나의 틀린문제/장바구니 문제 리스트</h3>
															<div class="col-lg-12">
																<select class="form-control" name="levels" required="required">
																	<option>1번 문제</option>
																	<option>2번 문제</option>
																	<option>3</option>
																	<option>4</option>
																	<option>5</option>
																	<option>6</option>
																	<option>7</option>
																	<option>8</option>
																	<option>9</option>
																	<option>10</option>
																</select>
															</div>
														</div>
													
														<div class="col-lg-12">
															<!-- 문제 유형선택 -->
															<div class="container-fluid">
																<h3>문제 유형 선택</h3>
																<div class="form-horizontal" role="form">
																	<div class="col-lg-4">
																		<button type="button" class="btn btn-primary btn-block">분야</button>
																	</div>
																	<div class="col-lg-8">
																		<select class="form-control" name="field" required="required" style="cursor:auto" disabled>
																			<option>JAVA</option>
																			<option>WEB</option>
																			<option>DataBase</option>
																		</select>
																	</div>
																<br/>
																	<div class="col-lg-4">
																		<button type="button" class="btn btn-primary btn-block">파트</button>
																	</div>
																	<div class="col-lg-8">
																		<select class="form-control" name="part" required="required" style="cursor:auto" disabled>
																			<option>Part1</option>
																			<option>Part2</option>
																			<option>Part3</option>
																			<option>Part4</option>
																			<option>Part5</option>
																			<option>Part6</option>
																		</select>
																	</div>
																<br/>
																	<div class="col-lg-4">
																		<button type="button" class="btn btn-primary btn-block">레벨</button>
																	</div>
																	<div class="col-lg-8">
																		<select class="form-control" name="levels" required="required" style="cursor:auto" disabled>
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
																<br/>
															</div>
															<!-- 문제 유형선택 끝 -->
														</div>	
													</div>
													<!-- row 끝 -->
													<div class="row">
														<div class="col-lg-12">
															<!-- 문제 지문입력 -->
															<div class="container-fluid">
																<h3>문제 지문 입력</h3>
																<div class="form-horizontal" role="form">
																	<textarea name="document" class="form-control col-lg-5" rows="5" required="required" style="cursor:auto" disabled></textarea>
																</div>
																<br/>
															</div>
															<!-- 문제 지문입력 끝 -->
														</div>	
													</div>
													<!-- row 끝 -->
													<!-- row 시작 -->
													<div class="row">
														<div class="col-lg-12">
															<!-- 선택지 입력 -->
															<div class="container-fluid">
																<h3>선택지 입력</h3>
																<div class="form-horizontal" role="form">
																	<div class="form-group form-group-lg">
																		<div class="col-lg-12">
																			<div class="col-lg-3">
																				<button type="button" class="btn btn-primary btn-block">1번 선택지</button>
																			</div>
																			<div class="col-lg-6">
																				<input class="form-control" type="text" id="number1" name="choice1" required="required" style="cursor:auto" disabled>
																			</div>
																			<div class="col-lg-3 radio">
																				<input type="radio" name="result" id="" value="1" checked style="cursor:auto" disabled>
																			</div>
																			<br/>
																		</div>
																		
																		<div class="col-lg-12">
																			<div class="col-lg-3">
																				<button type="button" class="btn btn-primary btn-block" >2번 선택지</button>
																			</div>
																			<div class="col-lg-6">
																				<input class="form-control" type="text" id="number2" name="choice2" required="required" style="cursor:auto" disabled>
																			</div>
																			<div class="col-lg-3 radio">
																				<input type="radio" name="result" id="" value="2" style="cursor:auto" disabled>
																			</div>
																			<br/>
																		</div>
																		
																		<div class="col-lg-12">
																			<div class="col-lg-3">
																				<button type="button" class="btn btn-primary btn-block" >3번 선택지</button>
																			</div>
																			<div class="col-lg-6">
																				<input class="form-control" type="text" id="number3" name="choice3" required="required" style="cursor:auto" disabled>
																			</div>
																			<div class="col-lg-3 radio">
																				<input type="radio" name="result" id="" value="3" style="cursor:auto" disabled>
																			</div>
																			<br/>
																		</div>
																		
																		<div class="col-lg-12">
																			<div class="col-lg-3">
																				<button type="button" class="btn btn-primary btn-block" >4번 선택지</button>
																			</div>
																			<div class="col-lg-6">
																				<input class="form-control" type="text" id="number4" name="choice4" required="required" style="cursor:auto" disabled>
																			</div>
																			<div class="col-lg-3 radio">
																				<input type="radio" name="result" id="" value="4" style="cursor:auto" disabled>
																			</div>
																			<br/>
																		</div>
																	</div>
																</div>
															</div>
															<!-- 선택지 입력 끝 -->
														</div>	
													</div>
													<!-- row 끝 -->
													<!-- row 시작 -->
													<div class="row">
														<div class="col-lg-12">
															<!-- 해설 내용입력 -->
															<div class="container-fluid">
																<h3>해설 내용 및 정답 입력</h3>
																<div class="form-horizontal" role="form">
																	<textarea name="commentary" class="form-control col-lg-5" rows="5" required="required" style="cursor:auto" disabled></textarea>
																</div>
																<br/>
															</div>
															<!-- 해설 내용입력 끝 -->
														</div>	
														<!-- col 끝 -->	
													</div>
													<!-- row 끝 -->
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">등록하기</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											</div>
										</div>
										<!-- 문제 추가 폼 끝 -->
									</div>
								</div>
								<!-- 문제 추가하기 모달 끝 -->
								<div class="btn-group pull-right" role="group">
									<button type="submit" class="btn btn-primary col-lg-4">글 수정</button>
									<button type="reset" class="btn btn-primary col-lg-4">다시쓰기</button>
									<button type="button" class="btn btn-primary col-lg-4" onclick="location.href = '/qboard/boardView.bo/${bnum}'">돌아가기</button>
								</div>
							</form>
						</div>
						<!-- 게시판 글쓰기 끝 -->	
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
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<p>Created by Coco Dingding</p>
		</div>
	</nav>
	<!-- 푸터 끝 -->

</body>
</html>