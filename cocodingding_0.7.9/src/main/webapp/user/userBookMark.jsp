<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>북마크</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- 게시판 스크립트 설정 -->
	<script type="text/javascript">
		function allCheckFunc( obj ) {
			$("[class=checkOne]").prop("checked", $(obj).prop("checked") );
		}
		
		/* 체크박스 체크시 전체선택 체크 여부 */
		function oneCheckFunc( obj )
		{
		var allObj = $("[class=checkAll]");
		var objName = $(obj).attr("class");
		
		if( $(obj).prop("checked") )
		{
			checkBoxLength = $("[class="+ objName +"]").length;
			checkedLength = $("[class="+ objName +"]:checked").length;
		
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}
		else
		{
			allObj.prop("checked", false);
		}
		}
		
		$(function(){
		$("[class=checkAll]").click(function(){
			allCheckFunc( this );
			checkField();
		});
		$("[class=checkOne]").each(function(){
			$(this).click(function(){
				oneCheckFunc( $(this) );
				checkField();
			});
		});
		});
		
		function checkField() {
			
			var frm	= document.BookMarkListform;
			
			if($("[name=javaCheck]").prop("checked")) {
				$("input[name=java]",frm).val('true');	
			}
			else{
				$("input[name=java]",frm).val('false');
			}
			
			if($("[name=webCheck]").prop("checked")) {
				$("input[name=web]",frm).val('true');	
			}
			else{
				$("input[name=web]",frm).val('false');
			}
			
			if($("[name=dbCheck]").prop("checked")) {
				$("input[name=db]",frm).val('true');	
			}
			else{
				$("input[name=db]",frm).val('false');
			}
			$("input[name=page]",frm).val(1);
		
			frm.submit();
		}
	</script>
	
	<script>
	    $(document).ready(function(){
	        $('[data-toggle="popover"]').popover();   
	    });
	</script>
	
	<!-- 게시판 스크립트 설정 끝 -->
	
	<script type="text/javascript">

		function paging(num) {
			var frm	= document.BookMarkListform;
			
			$("input[name=page]",frm).val(num);

			frm.submit();
		}
	</script>
	
  	<script type="text/javascript">
  		// 문제 삭제 질문 폼
	  	function bookMark_Delete(code) {
	  	    result = confirm('정말로 삭제 하시겠습니까');
	  	    if(result == true){
	  	        location.href = "bookMarkDelete.bm/" + code;
	  	    }else{
	  	    	return false;
	  	    }
  		}
 	</script>
	<!-- 게시판 스크립트 설정 끝 -->

	<style>
		/* 게시판 체크박스 설정 */
		input.checkList { display:none; }
		input.checkList:checked ~ label ul li span { color:red; }
		/* 게시판 체크박스 설정 */
		
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
	    
	   	/* 게시판 설정 http://bigfat.tistory.com/80 */
	    #container {
	      width: 100%;
	      margin: 0 auto;     /* 가로로 중앙에 배치 */
	    }
	     
	    #list {
	      text-align: center;
	    }
	   
	    /* 체크박스 리스트 */
	    /* 체크박스 본체 숨김 */
	  	input.checkAll { display:none; }
	  	input.checkOne { display:none; }
	  	/* 체크박스의 상태에 따라 연결된 레이블의 속성을 변경*/
		input.checkAll ~ label ul li span { color:grey; }
		input.checkOne ~ label ul li span { color:grey; }
		input.checkAll:checked ~ label ul li span { color:blue; }
		input.checkOne:checked ~ label ul li span { color:blue; }
	    /* 체크박스 리스트 */
	    
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
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">이메일 주소</label>
                            <input type="text" class="form-control" id="my_add" name="email" value="${userInfo.email}" required placeholder="변경할 이메일 주소">
                            <span class="help-block"></span>
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
				<!-- 사이드 랩. 감싸는부분 -->
				<div class="">				
					<!-- 사이드 사진 -->
					<div class="">
						<img class="img-responsive" src="/qboard/resources/img/user.jpg" >
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${userInfo.nickname}님<br>환영합니다.</h4>
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
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#modMember" data-backdrop="static" data-keyboard="false">회원정보수정</button>
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
				
				<!-- 패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">북마크</h2>
					</div>
					<form action ="/qboard/bookMarkList.bm" method="get" name="BookMarkListform">
						<!-- 패널바디 -->
						<div class="panel-body">
							<div class="col-xs-12">
								<!-- 체크박스 버튼 -->
								<div class="btn-group col-xs-8">
									<span>
									  <input type="checkbox" id="c1" class="checkAll" <c:if test="${java and web and db}">checked</c:if>>
									  <label for="c1">
									    <ul class="pagination">
									      <li><span>전체</span></li>
									    </ul>
									  </label>
									</span>
									<span>
									  <input type="hidden" name="java" value="${java}">
									  <input type="checkbox" id="c2" class="checkOne" name="javaCheck" <c:if test="${java}">checked</c:if>>
									  <label for="c2">
									    <ul class="pagination">
									      <li><span>Java</span></li>
									    </ul>
									  </label>
									</span>
									<span>
									  <input type="hidden" name="web" value="${web}">
									  <input type="checkbox" id="c3" class="checkOne" name="webCheck" <c:if test="${web}">checked</c:if>>
									  <label for="c3">
									    <ul class="pagination">
									      <li><span>Web</span></li>
									    </ul>
									  </label>
									</span>
									<span>
									  <input type="hidden" name="db" value="${db}">
									  <input type="checkbox" id="c4" class="checkOne" name="dbCheck" <c:if test="${db}">checked</c:if>>
									  <label for="c4">
									    <ul class="pagination">
									      <li><span>DB</span></li>
									    </ul>
									  </label>
									</span>
																
									<div class="col-xs-7" style="float:right;">
										<span class="glyphicon glyphicon-question-sign" data-toggle="popover" title="게시판 분야필터" data-content="보시고 싶은 분야를 선택해주세요."></span>
									</div>
									
								</div>
								<!-- 체크박스 버튼 -->
							</div>
							<!-- 본문 게시판 -->
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
									<b></b>
								</div>
								<div>
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th width="8%">번호</th>
												<th width="8%">분야</th>
												<th width="8%">단원</th>
												<th width="8%">레벨</th>
												<th width="50%">요약</th>
												<th width="10%">상세보기</th>
												<th width="8%">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="article" items="${list}" begin="${pageVO.curStartNumber}" end="${pageVO.curEndNumber}" varStatus="status">
												<tr>
													<td>${article.qnum}</td>
													<td>${article.field}</td>
													<td>${article.part}</td>
													<td>${article.levels}</td>
													<td>${article.abbrev}</td>
												    <td><!-- 문제 보기 버튼 -->
														<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modQuiz${status.index}">
															상세보기
														</button>
														<!-- 문제 보기 버튼 끝 -->
														<!-- 문제 보기 모달 -->
														<div class="modal fade" id="modQuiz${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-lg">
																<!-- 문제 추가 액션폼 -->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																		<h2 class="modal-title" id="myModalLabel">문제 보기</h2>
																	</div>
																	<div class="modal-body">
																		<div class="container-fluid">
																			<div class="row">
																				<!-- 문제 유형선택 -->
																				<div class="row">
																				    <div class="col-xs-12">
																					    <div class="table table-responsive">
																					        <table class="table">
																						        <tr>
																						        	<th class="success">문제분야</th>
																						            <td>
																										<select class="form-control" required="required">
																											<option <c:if test="${article.field eq 'JAVA'}">selected</c:if>>JAVA</option>
																											<option <c:if test="${article.field eq 'WEB'}">selected</c:if>>WEB</option>
																											<option <c:if test="${article.field eq 'DataBase'}">selected</c:if>>DataBase</option>
																										</select>
																						            </td>
																						            <td>
																										<select class="form-control" required="required">
																											<option <c:if test="${article.part eq 'Part1'}">selected</c:if>>Part1</option>
																											<option <c:if test="${article.part eq 'Part2'}">selected</c:if>>Part2</option>
																											<option <c:if test="${article.part eq 'Part3'}">selected</c:if>>Part3</option>
																											<option <c:if test="${article.part eq 'Part4'}">selected</c:if>>Part4</option>
																											<option <c:if test="${article.part eq 'Part5'}">selected</c:if>>Part5</option>
																											<option <c:if test="${article.part eq 'Part6'}">selected</c:if>>Part6</option>
																										</select>
																						            </td>
																						            <td>
																										<select class="form-control" required="required">
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
																						            </td>
																						        </tr>
																						        <tr>
																						            <th class="success">문제 지문</th>
																						            <td colspan="3">
																						               <textarea class="form-control" rows="5" style="resize: none;">${article.document}</textarea>
																						            </td>
																						        </tr>
																						        <tr>
																						            <th class="success">1번 지문</th>
																						            <td colspan="2">
																										<input class="form-control" type="text" id="number1" value="${article.choice1}" required="required">
																									</td>
																									<td>
																										<input type="radio" value="1" <c:if test="${article.result eq '1'}">checked</c:if>>
																						            </td>
																						        </tr>
																						        <tr>
																						        	<th class="success">2번 지문</th>
																						            <td colspan="2">
																										<input class="form-control" type="text" id="number2" value="${article.choice2}" required="required">
																									</td>
																									<td>
																										<input type="radio" value="2" <c:if test="${article.result eq '2'}">checked</c:if>>
																						            </td>
																						        </tr>
																						        <tr>
																						        	<th class="success">3번 지문</th>
																						            <td colspan="2">
																										<input class="form-control" type="text" id="number3" value="${article.choice3}" required="required">
																									</td>
																									<td>
																										<input type="radio" value="3" <c:if test="${article.result eq '3'}">checked</c:if>>
																						            </td>
																						        </tr>
																						        <tr>
																						        	<th class="success">4번 지문</th>
																						            <td colspan="2">
																										<input class="form-control" type="text" id="number4" value="${article.choice4}" required="required">
																									</td>
																									<td>
																										<input type="radio" value="4" <c:if test="${article.result eq '4'}">checked</c:if>>
																						            </td>
																						        </tr>
																						        <tr>
																						        	<th class="success">해설 및 정답</th>
																						        	<td colspan="3">
																										<textarea class="form-control col-lg-5" rows="5" style="resize: none;">${article.commentary}</textarea>
																									</td>
																						        </tr>
																						        <tr>
																						            <td colspan="6" class="text-center">
																						              <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
																						            </td>
																						        </tr>
																						   </table>
																						   </div>
																					   </div>
																				   </div>
																			   </div>
																		   </div>
																	   </div>
																   </div>
																<!-- 문제 보기 폼 끝 -->
															</div>
														</div>
														<!-- 문제 보기 모달 끝 -->
												    </td>
												    <td>
												    	<input type="button" class="btn btn-danger" onclick="bookMark_Delete('${article.qnum}')"  value="삭제">
												    </td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- 게시판 하단 -->
							<div class="">
								<input type="hidden" name="page" value="${pageVO.curPage}">
		
								<!-- 게시판 하단 페이지네이션 -->
								<nav>
									<div class="text-center">
										<ul class="pagination">
											<li><span style="cursor:pointer" onclick="paging(1)"><span class="glyphicon glyphicon-backward"></span>&nbsp;</span></li>
											<li><span style="cursor:pointer" <c:if test="${pageVO.curPage ne 1}">onclick="paging('${pageVO.prevPage}')"</c:if>>◀</span></li>
											<c:forEach var="pageNum" begin="${pageVO.startPage}" end="${pageVO.endPage}">
												<c:choose>
													<c:when test="${pageNum eq pageVO.curPage}">
														<li class="active"><span>${pageNum}</span></li>
													</c:when>
													<c:otherwise>
														<li><span style="cursor:pointer" onclick="paging('${pageNum}')">${pageNum}</span></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<li><span style="cursor:pointer" <c:if test="${pageVO.curPage ne pageVO.pageCnt && pageVO.pageCnt > 0}">onclick="paging('${pageVO.nextPage}')"</c:if>>▶</span></li>
											<li><span style="cursor:pointer" onclick="paging('${pageVO.pageCnt}')">&nbsp;<span class="glyphicon glyphicon-forward"></span></span></li>
										</ul>
									</div>
								</nav>
								<!-- 게시판 하단 페이지네이션 끝 -->
								
								<!-- 게시판 검색 란 -->
								<div class="text-center">
									<div class="col-xs-3">
										<select class="form-control" name="opt" onchange="pagingField();">
											<option value="0" <c:if test="${opt eq 0}">selected</c:if>>단원</option>
											<option value="1" <c:if test="${opt eq 1}">selected</c:if>>레벨</option>
											<option value="2" <c:if test="${opt eq 2}">selected</c:if>>본문</option>
										</select>
									</div>
									<div class="col-xs-4">
										<input class="form-control" type="text" size="20" name="condition" value="${condition}">&nbsp;
									</div>
									<div class="col-xs-3">
										<input type="submit" class="btn btn-primary" value="검색"/>
									</div>
								</div>
								<!-- 게시판 검색 란 끝 -->
							</div>
							<!-- 게시판 하단 끝 -->
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