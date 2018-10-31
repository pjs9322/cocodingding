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
	
	<!-- 회원가입 유효성검사 스크립트 -->
    <script src="/qboard/resources/js/formValidCheck.js"></script>

    <!-- 모달 폼 초기화 스크립트-->
    <script>
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
        });
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
			font-size: 30px;
			background-color: black;
		}
	   
		 /* 로우 컨텐트 */
		.row.content {
			height: 100%;
		}
		
		/* 바디 */
		body {
			padding-top: 80px;
			padding-bottom: 80px;
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
		textarea:disabled {
			background: #ffffff;
		}
	    
	    /* 글꼴설정 */
		@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans');
		
		body, .table-condensed, .fontchange>h4, h1, h2, h3, h4 {
		   font-family: 'Black Han Sans', sans-serif;
		   font-weight: bold;
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
				<img class="" src="/qboard/resources/img/logo5.png">
			</div>
			<!-- 네비 로고 끝 -->
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 카테고리- -->
				<ul class="nav navbar-nav">
					<c:if test="${userInfo.admin eq 1}">
						<li><a href="/qboard/admin.me">회원관리</a></li>
						<li><a href="/qboard/admin.qu">문제관리</a></li>
					</c:if>
					<c:if test="${userInfo.admin eq 0}">
						<li><a href="/qboard/user.me">나의 페이지</a></li>
						<li><a href="/qboard/select.qu/JAVA">JAVA</a></li>
						<li><a href="/qboard/select.qu/WEB">WEB</a></li>
						<li><a href="/qboard/select.qu/DataBase">DataBase</a></li>
						<li><a href="/qboard/incorrectList.ic">틀린문제</a></li>
						<li><a href="/qboard/bookMarkList.bm">북마크</a></li>
					</c:if>
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
	
	<!-- 모달로 만든 회원정보수정 -->
    <div id="modMember" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                      <h2 class="modal-title text-center">회원정보 수정</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="/qboard/modPro.me" name="g" method="post" onsubmit="return sendIt1();">
                        <div class="form-group">
                            <label for="username" class="control-label">아이디</label>
                            <input type="text" class="form-control" id="my_id" name="id" value="${userInfo.id}"  readOnly>
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">비밀번호</label>
                            <input type="password" class="form-control" id="my_pwd" name="password" required placeholder="변경할 비밀번호 입력">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="my_pwd1" name="passcheck" required placeholder="변경할 비밀번호 확인">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="nickname" class="control-label">닉네임</label>
                            <input type="text" class="form-control" id="my_nick" name="nickname" value="${userInfo.nickname}" required placeholder="변경할 닉네임">
                            <span class="help-block"></span>
                            <a id="nickname_check" href="#" class="btn btn-primary btn-sm">
                                    닉네임 중복검사
                                </a>
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">이메일 주소</label>
                            <input type="text" class="form-control" id="my_add" name="email" value="${userInfo.email}" required placeholder="변경할 이메일 주소">
                            <span class="help-block"></span>
                            <a id="emailname_check" href="#" class="btn btn-primary btn-sm">
                                    이메일 중복검사
                                </a>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg">정보 수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
						<img class="img-responsive" src="/qboard/resources/img/user.jpg" >
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${userInfo.nickname}님 환영합니다.</h4>
						<c:if test="${userInfo.admin eq 0}">
						<h4>JAVA Lv.${userInfo.java}</h4>
						<h4>WEB Lv.${userInfo.web}</h4>
						<h4>DB Lv.${userInfo.database}</h4>
						</c:if>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<c:if test="${userInfo.admin eq 0}">
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href = '/qboard/modForm.me'">회원정보수정</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/my'">나의 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/ask'">질문 게시판</button>
						</c:if>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/all'">전체 게시판</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드바 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 중앙 본문 -->
			<div class="col-lg-10 text-left"> 
			
				<!-- 상단 패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">게시판 - 상세보기</h2>
					</div>
					<div class="panel-body">
						<!-- 게시물 -->
						<div class="col-lg-1">
						</div>
						<div class="col-lg-1">
							<div>
								<h4>제&nbsp;&nbsp;&nbsp;&nbsp;목</h4>
							</div>
							<br/>
							<div>
								<h4>내&nbsp;&nbsp;&nbsp;&nbsp;용</h4>
							</div>
						</div>
						<div class="col-lg-9">
							<!-- 게시물 패널 -->
							<div class="panel panel-success">
								<div class="panel-heading">
									<h2 class="panel-title">
										${article.title}
									</h2>
								</div>
								<div class="panel-body">
									<textarea class="col-lg-12" rows="15" cols="70" disabled>${article.document}</textarea>
									<br>
									<!-- 문제 보기 버튼 -->
									<div class="col-lg-12">
										<button type="button" class="btn btn-success btn-lg center-block" data-toggle="modal" data-target="#makeQuiz">
											등록된 문제 보기
										</button>
									</div>
									<!-- 문제 보기 버튼 끝 -->
									<!-- 문제 보기 모달 -->
									<div class="modal fade" id="makeQuiz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<!-- 문제 추가 액션폼 -->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h2 class="modal-title" id="myModalLabel">등록된 문제</h2>
												</div>
												<div class="modal-body">
													<div class="container-fluid">
														<div class="row">
															<div class="col-lg-12">
																<!-- 문제 유형선택 -->
																<div class="container-fluid">
																	<h3>문제 유형</h3>
																	<div class="form-horizontal" role="form">
																		<div class="col-lg-4">
																			<button type="button" class="btn btn-primary btn-block">분야</button>
																		</div>
																		<div class="col-lg-8">
																			<select class="form-control" name="fieldQ" style="cursor:auto">
																				<option <c:if test="${quiz.field eq 'JAVA'}">selected</c:if>>JAVA</option>
																				<option <c:if test="${quiz.field eq 'WEB'}">selected</c:if>>WEB</option>
																				<option <c:if test="${quiz.field eq 'DataBase'}">selected</c:if>>DataBase</option>
																			</select>
																		</div>
																	<br/>
																		<div class="col-lg-4">
																			<button type="button" class="btn btn-primary btn-block">파트</button>
																		</div>
																		<div class="col-lg-8">
																			<select class="form-control" name="part" style="cursor:auto">
																				<option <c:if test="${quiz.part eq 'Part1'}">selected</c:if>>Part1</option>
																				<option <c:if test="${quiz.part eq 'Part2'}">selected</c:if>>Part2</option>
																				<option <c:if test="${quiz.part eq 'Part3'}">selected</c:if>>Part3</option>
																				<option <c:if test="${quiz.part eq 'Part4'}">selected</c:if>>Part4</option>
																				<option <c:if test="${quiz.part eq 'Part5'}">selected</c:if>>Part5</option>
																				<option <c:if test="${quiz.part eq 'Part6'}">selected</c:if>>Part6</option>
																			</select>
																		</div>
																	<br/>
																		<div class="col-lg-4">
																			<button type="button" class="btn btn-primary btn-block">레벨</button>
																		</div>
																		<div class="col-lg-8">
																			<select class="form-control" name="levels" style="cursor:auto">
																				<option value="1" <c:if test="${quiz.levels eq 1}">selected</c:if>>Lv 1</option>
																				<option value="2" <c:if test="${quiz.levels eq 2}">selected</c:if>>Lv 2</option>
																				<option value="3" <c:if test="${quiz.levels eq 3}">selected</c:if>>Lv 3</option>
																				<option value="4" <c:if test="${quiz.levels eq 4}">selected</c:if>>Lv 4</option>
																				<option value="5" <c:if test="${quiz.levels eq 5}">selected</c:if>>Lv 5</option>
																				<option value="6" <c:if test="${quiz.levels eq 6}">selected</c:if>>Lv 6</option>
																				<option value="7" <c:if test="${quiz.levels eq 7}">selected</c:if>>Lv 7</option>
																				<option value="8" <c:if test="${quiz.levels eq 8}">selected</c:if>>Lv 8</option>
																				<option value="9" <c:if test="${quiz.levels eq 9}">selected</c:if>>Lv 9</option>
																				<option value="10" <c:if test="${quiz.levels eq 10}">selected</c:if>>Lv 10</option>
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
																	<h3>문제 지문</h3>
																	<div class="form-horizontal" role="form">
																		<textarea name="documentQ" class="form-control col-lg-5" rows="5" required="required">${article.document}</textarea>
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
																	<h3>선택지</h3>
																	<div class="form-horizontal" role="form">
																		<div class="form-group form-group-lg">
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block">1번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number1" name="choice1" value="${article.choice1}" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio1" value="1" <c:if test="${article.result eq '1'}">checked</c:if> style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >2번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number2" name="choice2" value="${article.choice2}" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio2" value="2" <c:if test="${article.result eq '2'}">checked</c:if> style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >3번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number3" name="choice3" value="${article.choice3}" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio3" value="3" <c:if test="${article.result eq '3'}">checked</c:if> style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >4번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number4" name="choice4" value="${article.choice4}" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio4" value="4" <c:if test="${article.result eq '4'}">checked</c:if> style="cursor:auto">
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
																	<h3>해설 내용 및 정답</h3>
																	<div class="form-horizontal" role="form">
																		<textarea name="commentary" class="form-control col-lg-5" rows="5" style="cursor:auto">${article.commentary}</textarea>
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
													<button type="button" class="btn btn-primary" data-dismiss="modal">돌아가기</button>
												</div>
											</div>
											<!-- 문제 추가 폼 끝 -->
										</div>
									</div>
									<!-- 문제 보기 모달 끝 -->
								</div>
							</div>
							<!-- 게시물 패널 끝 -->
						</div>
						<!-- 게시물 끝 -->
						<!-- 게시판 하단 -->
						<div class="">
							<!-- 게시판 댓글 -->
							<div class="form-group row">
								<form action="/qboard/replyInsert.bo/${bnum}" method="post" name="replyform">
									<!-- 이전 댓글 -->
									<div class="col-lg-10 pull-right">
										<div class="col-lg-2">작성자</div>
										<div class="col-lg-6">작성내용</div>
										<div class="col-lg-2">작성일</div>
										<div class="col-lg-2"></div>
									</div>
									<c:forEach var="item" items="${replylist}">
										<div class="col-lg-10 pull-right">
											<div class="col-lg-2">${item.nickname}</div>
											<div class="col-lg-6">${item.document}</div>
											<div class="col-lg-2">${item.bdate}</div>
											<div class="col-lg-2"><a href="/qboard/replyDelete.bo/${bnum}/${item.rnum}">[삭제]</a></div>
										</div>
									</c:forEach>
									<!-- 이전 댓글 끝 -->
									<!-- 댓글 등록 -->
									<div class="form-group row col-lg-11 pull-right">
										<div class="col-lg-3 text-center">
											<h5>댓글 작성하기</h5>
										</div>
										<div class="col-lg-7">
											<input type="hidden" name="id" value="${userInfo.id}" readOnly="readOnly" required="required">
											<input type="hidden" name="nickname" value="${userInfo.nickname}" readOnly="readOnly" required="required">
											<input type="text" class="form-control" name="document" placeholder="댓글을 입력해 주세요." required="required">
										</div>
										<div class="col-lg-2">
											<button type="submit" class="btn btn-success center-block" data-toggle="modal" data-target="#makeQuiz">
												댓글 등록
											</button>
										</div>
									</div>
									<!-- 댓글 등록 끝 -->
								</form>
							</div>
							<!-- 게시판 댓글 끝 -->
							<!-- 컨트롤-->
							<div class="btn-group pull-right" role="group">
								<button type="submit" class="btn btn-primary col-lg-4" onclick="location.href='/qboard/boardModifyForm.bo/${bnum}'">수정하기</button>
								<button type="reset" class="btn btn-primary col-lg-4" onclick="board_Delete('${bnum}')">삭제하기</button>
								<button type="button" class="btn btn-primary col-lg-4" onclick="location.href='/qboard/boardList.bo/${type}'">돌아가기</button>
							</div>
							<!-- 컨트롤 끝 -->	
						</div>
						<!-- 게시판 하단 끝 -->
					</div>
					<!-- 게시판 끝 -->
				</div>
				<!-- 상단 패널 끝 -->
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