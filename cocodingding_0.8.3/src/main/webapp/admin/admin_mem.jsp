<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>관리자 - 회원관리</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
    <!-- 회원정보 유효성검사 스크립트 -->
    <script src="/qboard/resources/js/formValidCheck.js"></script>
    
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
 	
	<!-- 게시판 스크립트 설정 -->
	<script type="text/javascript">

		function paging(num) {
			var frm	= document.adminMemForm;
			
			$("input[name=page]",frm).val(num);

			frm.submit();
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
			<!-- 네비 중앙-->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 카테고리- -->
				<ul class="nav navbar-nav">
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
						<img class="img-responsive" src="/qboard/resources/img/admin.png" >
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${userInfo.nickname}님<br>환영합니다.</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->
					<!-- 사이드 게시판목록 -->
					<div class="">
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='/qboard/boardList.bo/all'">게시판 관리</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 중앙 본문 -->
			<div class="col-lg-8 text-left"> 
				<!--패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">회원정보 리스트</h2>
					</div>
					<!-- 바디패널 -->
					<div class="panel-body">
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
											<th width="15%">ID</th>
											<th width="20%">비밀번호</th>
											<th width="15%">닉네임</th>
											<th width="30%">이메일</th>
											<th width="10%">수정</th>
											<th width="10%">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="article" items="${list}" begin="${pageVO.curStartNumber}" end="${pageVO.curEndNumber}" varStatus="status">
											<tr>
											    <td>${article.id}</td>
											    <td>${article.password}</td>
											    <td>${article.nickname}</td>
											    <td>${article.email}</td>
												<c:set var="admin" value="${article.admin}" />
												<c:choose>
												    <c:when test="${admin eq 1}">
													    <td>관리자</td>
													    <td>관리자</td>
												    </c:when>
												    <c:otherwise>
													    <td>
															<!-- 회원정보 수정버튼 -->
															<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modMember${status.index}">
																수정
															</button>
															<!-- 회원정보 수정버튼 끝 -->
															<!-- 모달로 만든 회원정보수정 -->
														    <div id="modMember${status.index}" class="modal fade">
														        <div class="modal-dialog">
														            <div class="modal-content">
														                <div class="modal-header">
														                      <h2 class="modal-title text-center">회원정보 수정</h2>
														                    <button type="button" class="close" data-dismiss="modal">&times;</button>
														                </div>
														                <div class="modal-body">
														                    <form  action="/qboard/admin_modPro.me" method="post" onsubmit="return sendIt1();">
														                        <div class="form-group">
														                            <label for="username" class="control-label">아이디</label>
														                            <input type="text" class="form-control" id="my_id" name="id" value="${article.id}" readOnly>
														                            <span class="help-block"></span>
														                        </div>
														                        <div class="form-group">
														                            <label for="password" class="control-label">비밀번호</label>
														                            <input type="text" class="form-control" id="my_pwd" name="password" value="${article.password}" required>
														                            <span class="help-block"></span>
														                        </div>
														                        <div class="form-group">
														                            <label for="nickname" class="control-label">닉네임</label>
														                            <input type="text" class="form-control" id="my_nick" name="nickname" value="${article.nickname}" required>
														                            <span class="help-block"></span>
														                        </div>
														                        <div class="form-group">
														                            <label for="email" class="control-label">이메일 주소</label>
														                            <input type="text" class="form-control" id="my_add" name="email" value="${article.email}" required>
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
														    <!-- 모달로 만든 회원정보수정 끝 -->
														</td>
													    <td>
													    	<input type="button" class="btn btn-danger" onclick="admin_userDelete('${article.id}')"  value="삭제">
													    </td>
												    </c:otherwise>
												</c:choose>
											<tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 사이드 게시판 끝 -->
						
						<!-- 게시판 하단 -->
						<div class="">
							<form action ="/qboard/admin.me" method="get" name="adminMemForm">
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
									<select class="form-control" name="opt">
										<option value="0" <c:if test="${opt eq 0}">selected</c:if>>ID</option>
										<option value="1" <c:if test="${opt eq 1}">selected</c:if>>닉네임</option>
										<option value="2" <c:if test="${opt eq 2}">selected</c:if>>이메일</option>
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
							</form>
						</div>
						<!-- 게시판 하단 끝 -->
					</div>
					<!-- 바디패널 끝 -->
				</div>
				<!-- 패널 끝 -->
			</div>
			<!-- 본문 끝 -->
					
			<!-- 오른쪽 사이드바 -->
			<div class="col-lg-2 sidenav">
				<!-- 사이드 페이지 기능-->
				<div class="">
					
				</div>
				<!-- 사이드 페이지 기능 끝 -->
			</div>
			<!-- 사이드바 끝 -->
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
