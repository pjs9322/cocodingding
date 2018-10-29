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
  		// 문제 삭제 질문 폼
	  	function admin_quizDelete(code) {
	  	    result = confirm('정말로 삭제 하시겠습니까');
	  	    if(result == true){
	  	        location.href = "/qboard/admin_delete.qu/" + code;
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
						<img class="img-responsive" src="./resources/admin.png" >
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${userInfo.nickname}님 환영합니다.</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-default btn-lg btn-block">게시판 관리</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 섹션 본문 -->
			<div class="col-lg-8 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 게시판 -->
					<div class="">
						<h2>문제관리 게시판</h2>
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
											<th width="10%">문제번호</th>
											<th width="10%">분야</th>
											<th width="10%">단원</th>
											<th width="50%">요약</th>
											<th width="10%">수정</th>
											<th width="10%">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="article" items="${quizList}" varStatus="status">
											<tr>
												<td>${article.qnum}</td>
												<td>${article.field}</td>
												<td>${article.part}</td>
												<td>${article.abbrev}</td>
											    <td>
											    <!-- 문제 추가하기 버튼 -->
													<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modQuiz${status.index}">
														수정
													</button>
													<!-- 문제 추가하기 버튼 끝 -->
													<!-- 문제 추가하기 모달 -->
													<div class="modal fade" id="modQuiz${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<!-- 문제 수정 액션폼 -->
															<form action="/qboard/admin_modPro.qu" method="post">
																<input type="hidden" name="qnum" value="${article.qnum}">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																		<h2 class="modal-title" id="myModalLabel">문체 수정하기</h2>
																	</div>
																	<div class="modal-body">
																		<div class="container-fluid">
																			<div class="row">
																				<div class="col-lg-12">
																					<!-- 문제 유형선택 -->
																					<div class="container-fluid">
																						<h3>문제 유형 선택</h3>
																						<div class="form-horizontal" role="form">
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">분야</button>
																							</div>
																							<div class="col-lg-8">
																								<select class="form-control" name="field" required="required">
																									<option <c:if test="${article.field eq 'JAVA'}">selected</c:if>>JAVA</option>
																									<option <c:if test="${article.field eq 'WEB'}">selected</c:if>>WEB</option>
																									<option <c:if test="${article.field eq 'DataBase'}">selected</c:if>>DataBase</option>
																								</select>
																							</div>
																						<br/>
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">파트</button>
																							</div>
																							<div class="col-lg-8">
																								<select class="form-control" name="part" required="required">
																									<option <c:if test="${article.part eq 'Part1'}">selected</c:if>>Part1</option>
																									<option <c:if test="${article.part eq 'Part2'}">selected</c:if>>Part2</option>
																									<option <c:if test="${article.part eq 'Part3'}">selected</c:if>>Part3</option>
																									<option <c:if test="${article.part eq 'Part4'}">selected</c:if>>Part4</option>
																									<option <c:if test="${article.part eq 'Part5'}">selected</c:if>>Part5</option>
																									<option <c:if test="${article.part eq 'Part6'}">selected</c:if>>Part6</option>
																								</select>
																							</div>
																						<br/>
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">레벨</button>
																							</div>
																							<div class="col-lg-8">
																								<select class="form-control" name="levels" required="required">
																									<option value="1" <c:if test="${article.levels eq 1}">selected</c:if>>Lv 1</option>
																									<option value="2" <c:if test="${article.levels eq 2}">selected</c:if>>Lv 2</option>
																									<option value="3" <c:if test="${article.levels eq 3}">selected</c:if>>Lv 3</option>
																									<option value="4" <c:if test="${article.levels eq 4}">selected</c:if>>Lv 4</option>
																									<option value="5" <c:if test="${article.levels eq 5}">selected</c:if>>Lv 5</option>
																									<option value="6" <c:if test="${article.levels eq 6}">selected</c:if>>Lv 6</option>
																									<option value="7" <c:if test="${article.levels eq 7}">selected</c:if>>Lv 7</option>
																									<option value="8" <c:if test="${article.levels eq 8}">selected</c:if>>Lv 8</option>
																									<option value="9" <c:if test="${article.levels eq 9}">selected</c:if>>Lv 9</option>
																									<option value="10" <c:if test="${article.levels eq 10}">selected</c:if>>Lv 10</option>
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
																							<textarea name="document" class="form-control col-lg-5" rows="5" required="required">${article.document}</textarea>
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
																										<input class="form-control" type="text" id="number1" name="choice1" value="${article.choice1}" required="required">
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="1" <c:if test="${article.result eq '1'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">2번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number2" name="choice2" value="${article.choice2}" required="required">
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="2" <c:if test="${article.result eq '2'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">3번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number3" name="choice3" value="${article.choice3}" required="required">
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="3" <c:if test="${article.result eq '3'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">4번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number4" name="choice4" value="${article.choice4}" required="required">
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="4" <c:if test="${article.result eq '4'}">checked</c:if>>
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
																							<textarea name="commentary" class="form-control col-lg-5" rows="5" required="required">${article.commentary}</textarea>
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
																		<button type="submit" class="btn btn-primary">수정하기</button>
																		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
																	</div>
																</div>
															</form>
															<!-- 문제 수정 폼 끝 -->
														</div>
													</div>
													<!-- 문제 수정하기 모달 끝 -->
											    </td>
											    <td><a href="#" onclick="admin_quizDelete('${article.qnum}')">삭제</a></td>
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
			<div class="col-lg-2 sidenav">
				<!-- 사이드 바 랩 . 감싸는부분-->
				<div class="">
					<!-- 사이드 페이지 기능-->
					<div class="">
						<!-- 문제 추가하기 버튼 -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#makeQuiz">
							문제추가하기
						</button>
						<!-- 문제 추가하기 버튼 끝 -->
						<!-- 문제 추가하기 모달 -->
						<div class="modal fade" id="makeQuiz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<!-- 문제 추가 액션폼 -->
								<form action="/qboard/admin_make.qu" method="post">
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
														<!-- 문제 유형선택 -->
														<div class="container-fluid">
															<h3>문제 유형 선택</h3>
															<div class="form-horizontal" role="form">
																<div class="col-lg-4">
																	<button type="button" class="btn btn-primary btn-block">분야</button>
																</div>
																<div class="col-lg-8">
																	<select class="form-control" name="field" required="required">
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
																	<select class="form-control" name="part" required="required">
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
																	<select class="form-control" name="levels" required="required">
																		<option value="1">Lv 1</option>
																		<option value="2">Lv 2</option>
																		<option value="3">Lv 3</option>
																		<option value="4">Lv 4</option>
																		<option value="5">Lv 5</option>
																		<option value="6">Lv 6</option>
																		<option value="7">Lv 7</option>
																		<option value="8">Lv 8</option>
																		<option value="9">Lv 9</option>
																		<option value="10">Lv 10</option>
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
																<textarea name="document" class="form-control col-lg-5" rows="5" required="required"></textarea>
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
																			<input class="form-control" type="text" id="number1" name="choice1" required="required">
																		</div>
																		<div class="col-lg-3 radio">
																			<input type="radio" name="result" id="" value="1" checked>
																		</div>
																		<br/>
																	</div>
																	
																	<div class="col-lg-12">
																		<div class="col-lg-3">
																			<button type="button" class="btn btn-primary btn-block" >2번 선택지</button>
																		</div>
																		<div class="col-lg-6">
																			<input class="form-control" type="text" id="number2" name="choice2" required="required">
																		</div>
																		<div class="col-lg-3 radio">
																			<input type="radio" name="result" id="" value="2">
																		</div>
																		<br/>
																	</div>
																	
																	<div class="col-lg-12">
																		<div class="col-lg-3">
																			<button type="button" class="btn btn-primary btn-block" >3번 선택지</button>
																		</div>
																		<div class="col-lg-6">
																			<input class="form-control" type="text" id="number3" name="choice3" required="required">
																		</div>
																		<div class="col-lg-3 radio">
																			<input type="radio" name="result" id="" value="3">
																		</div>
																		<br/>
																	</div>
																	
																	<div class="col-lg-12">
																		<div class="col-lg-3">
																			<button type="button" class="btn btn-primary btn-block" >4번 선택지</button>
																		</div>
																		<div class="col-lg-6">
																			<input class="form-control" type="text" id="number4" name="choice4" required="required">
																		</div>
																		<div class="col-lg-3 radio">
																			<input type="radio" name="result" id="" value="4">
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
																<textarea name="commentary" class="form-control col-lg-5" rows="5" required="required"></textarea>
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
								</form>
								<!-- 문제 추가 폼 끝 -->
							</div>
						</div>
						<!-- 문제 추가하기 모달 끝 -->
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
