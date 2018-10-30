<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>장바구니</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- 게시판 스크립트 설정 -->
	<script type="text/javascript">
		function allCheckFunc( obj ) {
			$("[id=checkOne]").prop("checked", $(obj).prop("checked") );
		}
		
		/* 체크박스 체크시 전체선택 체크 여부 */
		function oneCheckFunc( obj )
		{
		var allObj = $("[id=checkAll]");
		var objName = $(obj).attr("id");
		
		if( $(obj).prop("checked") )
		{
			checkBoxLength = $("[id="+ objName +"]").length;
			checkedLength = $("[id="+ objName +"]:checked").length;
		
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
		$("[id=checkAll]").click(function(){
			allCheckFunc( this );
			checkField();
		});
		$("[id=checkOne]").each(function(){
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
					<li><a href="/qboard/select.qu/JAVA">JAVA</a></li>
					<li><a href="/qboard/select.qu/WEB">WEB</a></li>
					<li><a href="/qboard/select.qu/DataBase">DataBase</a></li>
					<li><a href="/qboard/incorrectList.ic">틀린문제</a></li>
					<li><a href="/qboard/bookMarkList.bm">장바구니</a></li>
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
	
<form action ="/qboard/bookMarkList.bm" method="get" name="BookMarkListform">
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
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 본문 -->
			<div class="col-lg-10 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h2>장바구니</h2>
						<hr/>
					</div>
					<!-- 본문 상단 끝 -->
					
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
								<b>게시판 </b>
							</div>
							<div>
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th width="5%">문제번호</th>
											<th width="10%">분야</th>
											<th width="10%">단원</th>
											<th width="5%">레벨</th>
											<th width="50%">요약</th>
											<th width="10%">문제보기</th>
											<th width="10%">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="article" items="${list}" begin="${pageVO.curStartNumber}" end="${pageVO.curEndNumber}"  >
											<tr>
												<td>${article.qnum}</td>
												<td>${article.field}</td>
												<td>${article.part}</td>
												<td>${article.levels}</td>
												<td>${article.abbrev}</td>
											    <td>
											    <!-- 문제 보기 버튼 -->
													<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modQuiz${status.index}">
														문제 보기
													</button>
													<!-- 문제 보기 버튼 끝 -->
													<!-- 문제 보기 모달 -->
													<div class="modal fade" id="modQuiz${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<!-- 문제 수정 액션폼 -->
																<input type="hidden" name="qnum" value="${article.qnum}">
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
																				<div class="col-lg-12">
																					<!-- 문제 유형선택 -->
																					<div class="container-fluid">
																						<h3>문제 유형</h3>
																						<div class="form-horizontal" role="form">
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">분야</button>
																							</div>
																							<div class="col-lg-8">
																								<input type="text" name="field" value="${article.field}" readOnly>
																							</div>
																						<br/>
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">파트</button>
																							</div>
																							<div class="col-lg-8">
																								<input type="text" name="part" value="${article.part}" readOnly>
																							</div>
																						<br/>
																							<div class="col-lg-4">
																								<button type="button" class="btn btn-primary btn-block">레벨</button>
																							</div>
																							<div class="col-lg-8">
																								<input type="text" name="levels" value="${article.levels}" readOnly>
																							</div>
																						</div>
																						<br/>
																					</div>
																					<!-- 문제 유형 출력 끝 -->
																				</div>	
																			</div>
																			<!-- row 끝 -->
																			<div class="row">
																				<div class="col-lg-12">
																					<!-- 문제 출력 -->
																					<div class="container-fluid">
																						<h3>문제 지문</h3>
																						<div class="form-horizontal" role="form">
																							<textarea name="document" class="form-control col-lg-5" rows="5" readOnly>${article.document}</textarea>
																						</div>
																						<br/>
																					</div>
																					<!-- 문제 지문 출력 끝 -->
																				</div>	
																			</div>
																			<!-- row 끝 -->
																			<!-- row 시작 -->
																			<div class="row">
																				<div class="col-lg-12">
																					<!-- 선택지  -->
																					<div class="container-fluid">
																						<h3>선택지</h3>
																						<div class="form-horizontal" role="form">
																							<div class="form-group form-group-lg">
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">1번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number1" name="choice1" value="${article.choice1}" readOnly>
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="1" disabled <c:if test="${article.result eq '1'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">2번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number2" name="choice2" value="${article.choice2}" readOnly>
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="2" disabled <c:if test="${article.result eq '2'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">3번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number3" name="choice3" value="${article.choice3}" readOnly>
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="3" disabled <c:if test="${article.result eq '3'}">checked</c:if>>
																									</div>
																									<br/>
																								</div>
																								
																								<div class="col-lg-12">
																									<div class="col-lg-3">
																										<button type="button" class="btn btn-primary btn-block">4번 선택지</button>
																									</div>
																									<div class="col-lg-6">
																										<input class="form-control" type="text" id="number4" name="choice4" value="${article.choice4}" readOnly>
																									</div>
																									<div class="col-lg-3 radio">
																										<input type="radio" name="result" id="" value="4" disabled <c:if test="${article.result eq '4' }">checked</c:if>>
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
																							<textarea name="commentary" class="form-control col-lg-5" rows="5" readOnly>${article.commentary}</textarea>
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
																		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
																	</div>
																</div>
															<!-- 문제 수정 폼 끝 -->
														</div>
													</div>
													<!-- 문제 수정하기 모달 끝 -->
											    </td>
											    <td><a onclick="bookMark_Delete('${article.qnum}')">삭제</a></td>
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
						<!-- 페이지 이동부분 -->
						<nav>
							<ul class="pageVO">
								<c:if test="${pageVO.curRange ne 1 }">
								<input type="button" value="처음" onclick="paging(1)">
								</c:if>
								<c:if test="${pageVO.curPage ne 1}">
								<input type="button" value="이전" onclick="paging('${pageVO.prevPage}')">
								</c:if>
								<c:forEach var="pageNum" begin="${pageVO.startPage}" end="${pageVO.endPage}">
								<c:choose>
								<c:when test="${pageNum eq pageVO.curPage}">
								<input type="button" value="${pageNum}" onclick="paging('${pageNum}')">
								</c:when>
								<c:otherwise>
								<input type="button" value="${pageNum}" onclick="paging('${pageNum}')">
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pageVO.curPage ne pageVO.pageCnt && pageVO.pageCnt > 0}">
								<input type="button" value="다음" onclick="paging('${pageVO.nextPage}')">
								</c:if>
								<c:if test="${pageVO.curRange ne pageVO.rangeCnt && pageVO.rangeCnt > 0}">
								<input type="button" value="끝" onclick="paging('${pageVO.pageCnt}')">
								</c:if>
							</ul>
						</nav>
						<!-- 게시판 하단 페이지네이션 끝 -->
						<!-- 게시판 분류 드롭다운 -->
						<div class="col-lg-3">
						<table>
							<thead>
								<tr>
									<th>
										<input type="checkbox" id="checkAll" <c:if test="${java and web and db}">checked</c:if>>
									</th>
									<th>전체선택</th>
									<td>
										<input type="checkbox" id="checkOne" name="javaCheck" <c:if test="${java}">checked</c:if>>
										<input type="hidden" name="java" value="${java}">
									</td>
									<td>Java</td>
									<td>
										<input type="checkbox" id="checkOne" name="webCheck" <c:if test="${web}">checked</c:if>>
										<input type="hidden" name="web" value="${web}">
									</td>
									<td>Web</td>
									<td>
										<input type="checkbox" id="checkOne" name="dbCheck" <c:if test="${db}">checked</c:if>>
										<input type="hidden" name="db" value="${db}">
									</td>
									<td>DB</td>
								</tr>
							</tbody>
					</table>
						</div>
						<!-- 게시판 분류 드롭다운 끝 -->
						<!-- 게시판 검색 란 -->
						<div class="col-lg-9">
							<div class="input-group">
								<select name="opt">
									<option value="0" <c:if test="${opt eq 0}">selected</c:if>>단원</option>
									<option value="1" <c:if test="${opt eq 1}">selected</c:if>>레벨</option>
									<option value="2" <c:if test="${opt eq 2}">selected</c:if>>본문</option>
								</select>
									<input type="text" size="20" name="condition" value="${condition}">&nbsp;
									<input type="submit" value="검색"/>
							</div>
						</div>
						<!-- 게시판 검색 란 끝 -->
					</div>
					<!-- 게시판 하단 끝 -->
				</div>
				<!-- 본문 랩 끝 -->
			</div>
			<!-- 본문 끝 -->
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 섹션 끝 -->
</form>


	<!-- 푸터 -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<p>Created by Coco Dingding</p>
		</div>
	</nav>
	<!-- 푸터 끝 -->

</body>
</html>