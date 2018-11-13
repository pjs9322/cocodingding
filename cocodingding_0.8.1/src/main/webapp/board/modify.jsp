<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

			<c:forEach var="item" items="${list}">
				if ($("select[name=qnum]",frm).val() == ${item.qnum}) {
					$("select[name=fieldQ]",frm).val("${item.field}");
					$("select[name=part]",frm).val("${item.part}");
					$("select[name=levels]",frm).val("${item.levels}");
					$("textarea[name=documentQ]",frm).val($("textarea[name=hidedoc_${item.qnum}]",frm).val());
					$("input[name=choice1]",frm).val("${item.choice1}");
					$("input[name=choice2]",frm).val("${item.choice2}");
					$("input[name=choice3]",frm).val("${item.choice3}");
					$("input[name=choice4]",frm).val("${item.choice4}");
					$("input[id=radio${item.result}]",frm).prop("checked", true);
					$("textarea[name=commentary]",frm).val($("textarea[name=hidecom_${item.qnum}]",frm).val());
				}
			</c:forEach>
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
			font-size: 20px;
			background-color: white;
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
		
		footer {
		  background-color: #f2f2f2;
		  padding: 25px;
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
	<nav class="navbar navbar-default navbar-fixed-top">
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
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">문제 선택하기
							<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/qboard/select.qu/JAVA">JAVA</a></li>
								<li><a href="/qboard/select.qu/WEB">WEB</a></li>
								<li><a href="/qboard/select.qu/DataBase">Database</a></li>
							</ul>
						</li>
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
						<h4>${userInfo.nickname}님<br>환영합니다.</h4>
						<c:if test="${userInfo.admin eq 0}">
						<!-- 레벨패널 -->
						<div class="panel panel-danger">
							<div class="panel-heading">
								<h2 class="panel-title">
									현재 나의 레벨
								</h2>
							</div>
							<div class="panel-body">
								<h4>JAVA Lv.${userInfo.java}</h4>
								<h4>WEB Lv.${userInfo.web}</h4>
								<h4>DB Lv.${userInfo.database}</h4>
							</div>
						</div>
						<!-- 레벨패널 끝 -->
						</c:if>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/all'">게시판</button>
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
					    <h2 class="panel-title">게시판 - 수정하기</h2>
					</div>
					<form action="/qboard/boardUpdate.bo/${bnum}" method="post" name="boardform">
						<!-- 패널바디 -->
						<div class="panel-body">
							<!-- 게시판 -->
							<div class="table table-responsive col-xs-12">
								<table class="table">
									<tr>
										<th class="success">작성자</th>
										<td>
											<input type="hidden" class="form-control" name="id" value="${userInfo.id}" readOnly="readOnly" style="cursor:auto">
									    	<input type="text" class="form-control"  name="nickname" value="${userInfo.nickname}" readOnly="readOnly" style="cursor:auto">
										</td>
										<th class="success">분야</th>
										<td>
											<select class="form-control" name="field" required="required">
												<option>JAVA</option>
												<option>WEB</option>
												<option>DataBase</option>
											</select>
										</td>
									</tr>
								
									<tr>
									</tr>
								 
									<tr>
										<th class="success">제목</th>
										<td colspan="3">
											<input type="text" class="form-control" name="title" placeholder="제목" value="${article.title}" required="required">
										</td>
									</tr>
								 
									<tr>
										<th class="success">글 내용</th>
										<td colspan="3">
											<textarea class="form-control" rows="10" name="document" required="required" style="resize: none;">${article.document}</textarea>
										</td>
									</tr>
								    
									<tr>
										<td colspan="4" class="text-center">
											<button type="button" class="btn btn-warning" onclick="history.back()">돌아가기</button>
											<button type="reset" class="btn btn-danger">다시쓰기</button>
											<button type="submit" class="btn btn-primary">등록하기</button>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#makeQuiz">첨부문제</button>
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
																	<!-- 모달 문제추가하기 -->
																	<div class="row">
																	    <div class="col-xs-12">
																		    <div class="table table-responsive">
																		    
																				<!-- 문제 본문/해설 목록 -->
																				<c:forEach var="item" items="${list}">
																					<textarea name="hidedoc_${item.qnum}" style="display:none;">${item.document}</textarea>
																					<textarea name="hidecom_${item.qnum}" style="display:none;">${item.commentary}</textarea>
																				</c:forEach>
																				<!-- 문제 본문/해설 목록 -->
																				
																		        <table class="table">
																			        <tr>
																			            <th class="success col-xs-2">나의 문제 리스트</th>
																			            <td colspan="5">
																							<select class="form-control" name="qnum" onchange="selectQuiz()">
																								<option value='0' selected>문제번호 선택</option>
																								<c:forEach var="item" items="${list}" varStatus="status">
																									<option value="${item.qnum}" <c:if test="${item.qnum eq article.qnum}">selected</c:if>>${item.field} :: ${item.abbrev}</option>
																								</c:forEach>
																							</select>
																			            </td>
																					</tr>
																			        <tr>
																			        	<th class="success">문제분야</th>
																			            <td>
																							<select class="form-control" name="fieldQ" style="cursor:auto">
																								<option <c:if test="${quiz.field eq 'JAVA'}">selected</c:if>>JAVA</option>
																								<option <c:if test="${quiz.field eq 'WEB'}">selected</c:if>>WEB</option>
																								<option <c:if test="${quiz.field eq 'DataBase'}">selected</c:if>>DataBase</option>
																							</select>
																			            </td>
																			            <td>
																							<select class="form-control" name="part" style="cursor:auto">
																								<option <c:if test="${quiz.part eq 'Part1'}">selected</c:if>>Part1</option>
																								<option <c:if test="${quiz.part eq 'Part2'}">selected</c:if>>Part2</option>
																								<option <c:if test="${quiz.part eq 'Part3'}">selected</c:if>>Part3</option>
																								<option <c:if test="${quiz.part eq 'Part4'}">selected</c:if>>Part4</option>
																								<option <c:if test="${quiz.part eq 'Part5'}">selected</c:if>>Part5</option>
																								<option <c:if test="${quiz.part eq 'Part6'}">selected</c:if>>Part6</option>
																							</select>
																			            </td>
																			            <td>
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
																			            </td>
																			        </tr>
																			        <tr>
																			            <th class="success">문제 지문</th>
																			            <td colspan="3">
																			               <textarea class="form-control" name="documentQ" rows="5" readOnly="readOnly" style="resize: none;">${quiz.document}</textarea>
																			            </td>
																			        </tr>
																			        <tr>
																			            <th class="success">1번 지문</th>
																			            <td colspan="2">
																							<input class="form-control" type="text" id="number1" name="choice1" value="${quiz.choice1}" style="cursor:auto">
																						</td>
																						<td>
																							<input type="radio" name="result" id="radio1" value="1" <c:if test="${quiz.result eq '1'}">checked</c:if> style="cursor:auto">
																			            </td>
																			        </tr>
																			        <tr>
																			        	<th class="success">2번 지문</th>
																			            <td colspan="2">
																							<input class="form-control" type="text" id="number2" name="choice2" value="${quiz.choice2}" style="cursor:auto">
																						</td>
																						<td>
																							<input type="radio" name="result" id="radio2" value="2" <c:if test="${quiz.result eq '2'}">checked</c:if> style="cursor:auto">
																			            </td>
																			        </tr>
																			        <tr>
																			        	<th class="success">3번 지문</th>
																			            <td colspan="2">
																							<input class="form-control" type="text" id="number3" name="choice3" value="${quiz.choice3}" style="cursor:auto">
																						</td>
																						<td>
																							<input type="radio" name="result" id="radio3" value="3" <c:if test="${quiz.result eq '3'}">checked</c:if> style="cursor:auto">
																			            </td>
																			        </tr>
																			        <tr>
																			        	<th class="success">4번 지문</th>
																			            <td colspan="2">
																							<input class="form-control" type="text" id="number4" name="choice4" value="${quiz.choice4}" style="cursor:auto">
																						</td>
																						<td>
																							<input type="radio" name="result" id="radio4" value="4" <c:if test="${quiz.result eq '4'}">checked</c:if> style="cursor:auto">
																			            </td>
																			        </tr>
																			        <tr>
																			        	<th class="success">해설 및 정답</th>
																			        	<td colspan="3">
																							<textarea name="commentary" class="form-control" rows="5" style="resize: none;">${quiz.commentary}</textarea>
																						</td>
																			        </tr>
																		        </table>
																		    </div>
																	    </div>
																	</div>
																</div>
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
										</td>
									</tr>
								</table>
							</div>
						</div>
						<!-- 패널바디 끝 -->
					</form>
				</div>
				<!-- 패널 끝 -->
			</div>
			<!-- 본문 끝 -->
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 섹션 끝 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center navbar-fixed-bottom">
		<p><b>© 2018 Coco Dingding. All Right Reserved.</b></p>
	</footer>
	<!-- 푸터 -->

</body>
</html>