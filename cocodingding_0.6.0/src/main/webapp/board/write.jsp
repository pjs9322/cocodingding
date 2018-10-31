.<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>게시판 - 글쓰기</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- 회원가입 유효성검사 스크립트 -->
    <script src="/qboard/resources/js/formValidCheck.js"></script>

    <!-- 모달 폼 초기화 스크립트-->
    <script>
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
        });
    </script>
    
    <script>
		function selectQuiz() {
			var frm	= document.boardform;

			$("input[name=choice1]",frm).val($("select[name=qnum]",frm).val());

			var qnum = new Array(); 
			var field = new Array(); 
			var part = new Array(); 
			var levels = new Array(); 
			var documentQ = new Array(); 
			var choice1 = new Array(); 
			var choice2 = new Array(); 
			var choice3 = new Array(); 
			var choice4 = new Array(); 
			var result = new Array(); 
			var commentary = new Array();
			
			<c:forEach items="${list}" var="item" >
				qnum.push("${item.qnum}");
				field.push("${item.field}");
				part.push("${item.part}");
				levels.push("${item.levels}");
				documentQ.push("${item.document}");
				choice1.push("${item.choice1}");
				choice2.push("${item.choice2}");
				choice3.push("${item.choice3}");
				choice4.push("${item.choice4}");
				result.push("${item.result}");
				commentary.push("${item.commentary}");
			</c:forEach>
			
			for (i = 0; i < qnum.length; i++) {
				if (qnum[i] == $("select[name=qnum]",frm).val()) {
					$("select[name=fieldQ]",frm).val(field[i]);
					$("select[name=part]",frm).val(part[i]);
					$("select[name=levels]",frm).val(levels[i]);
					$("textarea[name=documentQ]",frm).val(documentQ[i]);
					$("input[name=choice1]",frm).val(choice1[i]);
					$("input[name=choice2]",frm).val(choice2[i]);
					$("input[name=choice3]",frm).val(choice3[i]);
					$("input[name=choice4]",frm).val(choice4[i]);
					$("input[id=radio" + result[i] + "]",frm).prop("checked", true);
					$("textarea[name=commentary]",frm).val(commentary[i]);
				}
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
		input[readonly] {
    		background-color: transparent;
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
                            <input type="text" class="form-control" id="my_id" name="id" value="${userInfo.id}" readOnly>
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
				
				<!--패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">게시판 - 글쓰기</h2>
					</div>
					<!-- 바디패널 -->
					<div class="panel-body">
						<!-- 게시판 -->
						<div class="col-lg-12">
							<div class="">
								<form class="" action="/qboard/boardInsert.bo" method="post" name="boardform">
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
												<option>JAVA</option>
												<option>WEB</option>
												<option>DataBase</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-3 text-center">
											<h4>제&nbsp;&nbsp;&nbsp;&nbsp;목</h4>
										</div>
										<div class="col-lg-8">
											<input type="text" class="form-control" name="title" required="required">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-3 text-center">
											<h4>내&nbsp;&nbsp;&nbsp;&nbsp;용</h4>
										</div>
										<div class="col-lg-8">
											<textarea class="form-control col-lg-10"cols="60" rows="10" name="document" required="required"></textarea>
										</div>
									</div>
									<!-- 게시판 본문 끝 -->
									
									<!-- 문제 추가하기 버튼 -->
									<div class="col-lg-12">
										<div class="col-lg-1"></div>
										<div class="alert alert-success col-lg-8" role="alert">
										  	문제 추가하기 버튼으로 틀린문제 및 북마크 문제를 내용에 추가하여 게시 할 수 있습니다.
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
													<h2 class="modal-title" id="myModalLabel">문제 추가하기</h2>
												</div>
												<div class="modal-body">
													<div class="container-fluid">
														<div class="row">
															<div class="col-lg-12">
																<h3>나의 틀린문제/북마크 문제 리스트</h3>
																<div class="col-lg-12">
																	<select class="form-control" name="qnum" onchange="selectQuiz()">
																		<option value='0' selected>-- 문제번호 선택 --</option>
																		<c:forEach var="article" items="${list}" varStatus="status">
																			<option value="${article.qnum}">${article.qnum} :: ${article.abbrev}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														
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
																			<select class="form-control" name="part" style="cursor:auto">
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
																			<select class="form-control" name="levels" style="cursor:auto">
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
																		<textarea name="documentQ" class="form-control col-lg-5" rows="5" style="cursor:auto"></textarea>
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
																					<input class="form-control" type="text" id="number1" name="choice1" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio1" value="1" checked style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >2번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number2" name="choice2" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio2" value="2" style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >3번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number3" name="choice3" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio3" value="3" style="cursor:auto">
																				</div>
																				<br/>
																			</div>
																			
																			<div class="col-lg-12">
																				<div class="col-lg-3">
																					<button type="button" class="btn btn-primary btn-block" >4번 선택지</button>
																				</div>
																				<div class="col-lg-6">
																					<input class="form-control" type="text" id="number4" name="choice4" style="cursor:auto">
																				</div>
																				<div class="col-lg-3 radio">
																					<input type="radio" name="result" id="radio4" value="4" style="cursor:auto">
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
																		<textarea name="commentary" class="form-control col-lg-5" rows="5" style="cursor:auto"></textarea>
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
													<button type="button" class="btn btn-primary" data-dismiss="modal">등록하기</button>
												</div>
											</div>
											<!-- 문제 추가 폼 끝 -->
										</div>
									</div>
									<!-- 문제 추가하기 모달 끝 -->
									<!-- 컨트롤 -->
									<div class="btn-group pull-right" role="group">
										<button type="submit" class="btn btn-primary col-lg-4">글 등록</button>
										<button type="reset" class="btn btn-primary col-lg-4">다시쓰기</button>
										<button type="button" class="btn btn-primary col-lg-4" onclick="location.href = '/qboard/boardList.bo/${type}'">돌아가기</button>
									</div>
									<!-- 컨트롤 끝 -->	
								</form>
							</div>
						</div>
						<!-- 게시판  끝 -->
					</div>
					<!-- 바디패널 끝 -->
				</div>
				<!-- 패널 끝 -->
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