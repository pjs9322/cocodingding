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
					
						<!-- 게시판 댓글 -->
						<form action="/qboard/replyInsert.bo/${bnum}" method="post" name="replyform">
					    	<input type="hidden" name="id" value="${userInfo.id}" readOnly="readOnly" required="required">
							<input type="hidden" name="nickname" value="${userInfo.nickname}" readOnly="readOnly" required="required">
							<!-- 게시물 -->
							<table class="table">
								<tr>
									<th class="success col-xs-2 text-center" >글번호</th>
									<td class="text-center">${article.bnum}</td>
									<th class="success text-center">조회수</th>
									<td class="text-center" colspan="2">${article.views}</td>
								</tr>
								
								<tr>
									<th class="success text-center">작성자</th>
									<td class="text-center">${article.nickname}</td>
									<th class="success text-center">작성일</th>
									<td class="text-center" colspan="2">${article.bdate}</td>
								</tr>
								
								<tr>
									<th class="success text-center">제목</th>
									<td class="text-center" colspan="4">${article.title}</td>
								</tr>
								
								<tr>
									<th class="success text-center">글 내용</th>
									<td colspan="4">${article.document}</td>
								</tr>
								
								<tr>
									<td colspan="3"></td>
									<td class="col-xs-3"></td>
									<td class="col-xs-1"></td>
								</tr>
							    
								<!-- 댓글 목록 -->
								<tr>
									<th class="success text-center" colspan="5">댓글 목록</th>
								</tr>
								
								<c:forEach var="item" items="${replylist}"> 
									<tr>
										<th class="success text-center">${item.nickname}</th>
										<td class="col-lg-10" colspan="3">${item.document}</td>
										<td class="success"><input type="button" class="btn btn-danger" onclick="location.href = '/qboard/replyDelete.bo/${bnum}/${item.rnum}'"  value="댓글삭제"></td>
									</tr>
								</c:forEach>
								
								<tr>
								    <td colspan="5"></td>
								</tr>
								
								<!-- 댓글 등록 -->
								<tr>
								    <th class="success text-center">댓글 작성</th>
								    <td colspan="3"><input type="text" class="form-control" name="document" placeholder="댓글을 입력해 주세요." required="required"></td>
								    <td class="success"><button type="submit" class="btn btn-primary">댓글등록</button></td>
								</tr>
								<!-- 댓글 등록 끝 -->
							
							
								<!-- 컨트롤-->
						        <tr>
									<td colspan="5" class="text-center">
										<button type="button" class="btn btn-warning" onclick="location.href = '/qboard/boardList.bo/${type}'">목록보기</button>
										
										<!-- 게시글 작성자 또는 관리자의 경우 수정/삭제 버튼 표시 -->
						            	<c:if test="${userInfo.id eq article.id || userInfo.admin eq 1}">
											<button type="reset" class="btn btn-danger" onclick="board_Delete('${bnum}')">삭제하기</button>
											<button type="submit" class="btn btn-primary" onclick="location.href='/qboard/boardModifyForm.bo/${bnum}'">수정하기</button>
										</c:if>
										
										<!-- 첨부문제가 존재할 경우 첨부문제 표시 -->
						            	<c:if test="${quiz.qnum ne null}">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#makeQuiz">첨부문제</button>
						            	</c:if>
										<!-- 문제 보기 모달 -->
										<div class="modal fade" id="makeQuiz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<!-- 문제 보기 액션폼 -->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h2 class="modal-title" id="myModalLabel">첨부된 문제</h2>
													</div>
													<div class="modal-body">
														<div class="container-fluid">
															<div class="row">
																<!-- 모달 문제추가하기 -->
																<div class="row">
																    <div class="col-xs-12">
																	    <div class="table table-responsive">
																	        <table class="table">
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
																		               <textarea class="form-control" name="documentQ" rows="5" style="resize: none;">${quiz.document}</textarea>
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
														<button type="button" class="btn btn-warning" data-dismiss="modal">돌아가기</button>
													</div>
												</div>
												<!-- 문제 보기 폼 끝 -->
											</div>
										</div>
										<!-- 문제 보기 모달 끝 -->
							        </td>
						    	</tr>
							  <!-- 컨트롤 끝 --> 	     
						    </table>
					    </form>
					</div>  
					<!-- 패널바디 끝 -->
				</div>
				<!-- 상단 패널 끝 -->
			</div>
			<!-- 중앙 본문 끝 -->
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 중앙 끝 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center navbar-fixed-bottom">
		<p><b>© 2018 Coco Dingding. All Right Reserved.</b></p>
	</footer>
	<!-- 푸터 -->

</body>
</html>