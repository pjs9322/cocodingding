<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>사용자 페이지</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
    <!-- 회원가입 유효성검사 스크립트 -->
    <script src="/qboard/resources/js/formValidCheck.js"></script>
	
  	<!-- 자바스크립트 영역 -->
	<script type="text/javascript">
		function pagingField() {
			var frm = document.userSelectForm;
			
			$("select[name=levels]",frm).val(0);
			
			frm.submit();
		}
		
		function pagingLevels() {
			var frm	= document.userSelectForm;
			
			frm.submit();
		}
	</script>
    <!-- 모달 폼 초기화 스크립트-->
    <script>
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
        });
    </script>
    
    <!-- ? 팝오벼 설정 -->
    <script>
      $(document).ready(function(){
          $('[data-toggle="popover"]').popover();   
      });
    </script>
    <!-- ? 팝오벼 설정 -->
  
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
			overflow:hidden;
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
		
		.addscroll{
		height:790px;
		overflow:auto;
		}
		
		/* 글꼴설정 */
		@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans');
		
		body, .table-condensed, .fontchange>h4, h1, h2, h3, h4 {
		   font-family: 'Black Han Sans', sans-serif;
		   font-weight: bold;
		  }
		  
		  th, td{
		  text-align: center;
		  }
		
	</style>
	
	<!-- 레이더차트 설정 -->
    <script src="/qboard/resources/js/radar.js"></script>
    
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
						<!-- 사진변경 버튼 -->
						<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePic">
							사진변경
						</button> -->
						<!-- 사진변경 버튼 끝 -->
						<!-- 사진 모달창 -->
						<div class="modal fade" id="changePic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="changePic">사진변경</h3>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										</button>
									</div>
									<div class="modal-body">
										<input type="file" class="btn btn-sm btn-primary" name="" value="사진변경" >
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">등록</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 사진 모달창 끝 -->
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
			
			<!-- 본문 상단 -->
			<div class="col-lg-10 text-left addscroll">
				<!-- 상단 패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">학습현황</h2>
					</div>
					<div class="panel-body">
						<div class="table table-responsive">
							<form action="/qboard/user.me" name="userSelectForm" method="get">
								<table class="table">
						        	<tr>
							        	<th class="active col-xs-6">
							        		${userInfo.nickname}님의 영역/파트별 학습 그래프입니다.
						            		<span class="glyphicon glyphicon-question-sign" data-toggle="popover" title="회원님의 수준이 그래프로 표시됩니다." data-content="회색 범위는 전체 사용자 평균입니다. 회원님의 수준이 향상 될 수록 색상이 밝아집니다."></span>
					            		</th>
						            	<th class="success col-xs-3 text-center">
							            	분야 및 레벨
											<c:if test="${levels eq 0}">
												<span class="glyphicon glyphicon-question-sign" data-toggle="popover" title="실력진단을 완료하시면 파트별 레벨 확인이 가능합니다." data-content="상단메뉴를 클릭하여 실력진단을 완료해주세요."></span>
											</c:if>
											<c:if test="${levels ne 0}">
												<span class="glyphicon glyphicon-question-sign" data-toggle="popover" title="분야와 레벨을 선택하세요" data-content="오른쪽의 선택박스로 원하는 분야와 레벨의 내 수준을 확인할 수 있습니다."></span>
											</c:if>
										</th>
										<td>
											<select class="form-control" name="field" onchange="pagingField();">
												<option <c:if test="${field eq 'JAVA'}">selected</c:if>>JAVA</option>
												<option <c:if test="${field eq 'WEB'}">selected</c:if>>WEB</option>
												<option <c:if test="${field eq 'DataBase'}">selected</c:if>>DataBase</option>
											</select>
										</td>
										<td>
											<select class="form-control" name="levels" onchange="pagingLevels();">
												<c:if test="${levels ge 1}"><option value="1" <c:if test="${grade.levels ge 1}">selected</c:if>>Lv 1</option></c:if>
												<c:if test="${levels ge 2}"><option value="2" <c:if test="${grade.levels ge 2}">selected</c:if>>Lv 2</option></c:if>
												<c:if test="${levels ge 3}"><option value="3" <c:if test="${grade.levels ge 3}">selected</c:if>>Lv 3</option></c:if>
												<c:if test="${levels ge 4}"><option value="4" <c:if test="${grade.levels ge 4}">selected</c:if>>Lv 4</option></c:if>
												<c:if test="${levels ge 5}"><option value="5" <c:if test="${grade.levels ge 5}">selected</c:if>>Lv 5</option></c:if>
												<c:if test="${levels ge 6}"><option value="6" <c:if test="${grade.levels ge 6}">selected</c:if>>Lv 6</option></c:if>
												<c:if test="${levels ge 7}"><option value="7" <c:if test="${grade.levels ge 7}">selected</c:if>>Lv 7</option></c:if>
												<c:if test="${levels ge 8}"><option value="8" <c:if test="${grade.levels ge 8}">selected</c:if>>Lv 8</option></c:if>
												<c:if test="${levels ge 9}"><option value="9" <c:if test="${grade.levels ge 9}">selected</c:if>>Lv 9</option></c:if>
												<c:if test="${levels ge 10}"><option value="10" <c:if test="${grade.levels ge 10}">selected</c:if>>Lv 10</option></c:if>
											</select>
										</td>
									</tr>
							         
									<tr>
										<td colspan="4"></td>
									</tr>
							        
									<tr>
							            <td rowspan="8"><!-- 레이더차트 -->
											<div id="microservices"></div>
											<script>
												radar.show('#microservices', {
													size: 400,
													curve: false,
													metrics: [
														{
															name: "Part 1",
															range: [
																<c:if test="${field eq 'JAVA'}">"프로그래밍 기본"</c:if>
																<c:if test="${field eq 'WEB'}">"HTML 기본"</c:if>
																<c:if test="${field eq 'DataBase'}">"PL/SQL 기본"</c:if>,
																<c:if test="${field eq 'JAVA'}">"프로그래밍 기본"</c:if>
																<c:if test="${field eq 'WEB'}">"HTML 기본"</c:if>
																<c:if test="${field eq 'DataBase'}">"PL/SQL 기본"</c:if>,
																<c:if test="${field eq 'JAVA'}">"프로그래밍 기본"</c:if>
																<c:if test="${field eq 'WEB'}">"HTML 기본"</c:if>
																<c:if test="${field eq 'DataBase'}">"PL/SQL 기본"</c:if>,
																<c:if test="${field eq 'JAVA'}">"프로그래밍 기본"</c:if>
																<c:if test="${field eq 'WEB'}">"HTML 기본"</c:if>
																<c:if test="${field eq 'DataBase'}">"PL/SQL 기본"</c:if>,
																<c:if test="${field eq 'JAVA'}">"프로그래밍 기본"</c:if>
																<c:if test="${field eq 'WEB'}">"HTML 기본"</c:if>
																<c:if test="${field eq 'DataBase'}">"PL/SQL 기본"</c:if>,
															],
															target: ${grade.set1/2 - 1},
															actual: ${grade.part1/2 - 1}
														},
														{
															name: "Part 2",
															range: [
																<c:if test="${field eq 'JAVA'}">"변수/연산자/조건문/반복문"</c:if>
																<c:if test="${field eq 'WEB'}">"선택자 지정"</c:if>
																<c:if test="${field eq 'DataBase'}">"SQL 고급 구문"</c:if>,
																<c:if test="${field eq 'JAVA'}">"변수/연산자/조건문/반복문"</c:if>
																<c:if test="${field eq 'WEB'}">"선택자 지정"</c:if>
																<c:if test="${field eq 'DataBase'}">"SQL 고급 구문"</c:if>,
																<c:if test="${field eq 'JAVA'}">"변수/연산자/조건문/반복문"</c:if>
																<c:if test="${field eq 'WEB'}">"선택자 지정"</c:if>
																<c:if test="${field eq 'DataBase'}">"SQL 고급 구문"</c:if>,
																<c:if test="${field eq 'JAVA'}">"변수/연산자/조건문/반복문"</c:if>
																<c:if test="${field eq 'WEB'}">"선택자 지정"</c:if>
																<c:if test="${field eq 'DataBase'}">"SQL 고급 구문"</c:if>,
																<c:if test="${field eq 'JAVA'}">"변수/연산자/조건문/반복문"</c:if>
																<c:if test="${field eq 'WEB'}">"선택자 지정"</c:if>
																<c:if test="${field eq 'DataBase'}">"SQL 고급 구문"</c:if>
															],
															target:${grade.set2/2 - 1},
															actual:${grade.part2/2 - 1}
													    },
													    {
													      name: "Part 3",
															range: [
																<c:if test="${field eq 'JAVA'}">"객체지향 프로그래밍"</c:if>
																<c:if test="${field eq 'WEB'}">"CSS 스타일"</c:if>
																<c:if test="${field eq 'DataBase'}">"테이블과 뷰"</c:if>,
																<c:if test="${field eq 'JAVA'}">"객체지향 프로그래밍"</c:if>
																<c:if test="${field eq 'WEB'}">"CSS 스타일"</c:if>
																<c:if test="${field eq 'DataBase'}">"테이블과 뷰"</c:if>,
																<c:if test="${field eq 'JAVA'}">"객체지향 프로그래밍"</c:if>
																<c:if test="${field eq 'WEB'}">"CSS 스타일"</c:if>
																<c:if test="${field eq 'DataBase'}">"테이블과 뷰"</c:if>,
																<c:if test="${field eq 'JAVA'}">"객체지향 프로그래밍"</c:if>
																<c:if test="${field eq 'WEB'}">"CSS 스타일"</c:if>
																<c:if test="${field eq 'DataBase'}">"테이블과 뷰"</c:if>,
																<c:if test="${field eq 'JAVA'}">"객체지향 프로그래밍"</c:if>
																<c:if test="${field eq 'WEB'}">"CSS 스타일"</c:if>
																<c:if test="${field eq 'DataBase'}">"테이블과 뷰"</c:if>
															],
															target: ${grade.set3/2 - 1},
															actual: ${grade.part3/2 - 1}
														},
														{
															name: "Part 4",
															range: [
																<c:if test="${field eq 'JAVA'}">"예외처리/패키지와 클래스"</c:if>
																<c:if test="${field eq 'WEB'}">"Bootstrap"</c:if>
																<c:if test="${field eq 'DataBase'}">"인덱스 활용"</c:if>,
																<c:if test="${field eq 'JAVA'}">"예외처리/패키지와 클래스"</c:if>
																<c:if test="${field eq 'WEB'}">"Bootstrap"</c:if>
																<c:if test="${field eq 'DataBase'}">"인덱스 활용"</c:if>,
																<c:if test="${field eq 'JAVA'}">"예외처리/패키지와 클래스"</c:if>
																<c:if test="${field eq 'WEB'}">"Bootstrap"</c:if>
																<c:if test="${field eq 'DataBase'}">"인덱스 활용"</c:if>,
																<c:if test="${field eq 'JAVA'}">"예외처리/패키지와 클래스"</c:if>
																<c:if test="${field eq 'WEB'}">"Bootstrap"</c:if>
																<c:if test="${field eq 'DataBase'}">"인덱스 활용"</c:if>,
																<c:if test="${field eq 'JAVA'}">"예외처리/패키지와 클래스"</c:if>
																<c:if test="${field eq 'WEB'}">"Bootstrap"</c:if>
																<c:if test="${field eq 'DataBase'}">"인덱스 활용"</c:if>
															],
															target: ${grade.set4/2 - 1},
															actual: ${grade.part4/2 - 1}
														},
														{
															name: "Part 5",
															range: [
																<c:if test="${field eq 'JAVA'}">"컬렉션 프레임워크"</c:if>
																<c:if test="${field eq 'WEB'}">"자바 스크립트"</c:if>
																<c:if test="${field eq 'DataBase'}">"스토어드/프로시저와 함수"</c:if>,
																<c:if test="${field eq 'JAVA'}">"컬렉션 프레임워크"</c:if>
																<c:if test="${field eq 'WEB'}">"자바 스크립트"</c:if>
																<c:if test="${field eq 'DataBase'}">"스토어드/프로시저와 함수"</c:if>,
																<c:if test="${field eq 'JAVA'}">"컬렉션 프레임워크"</c:if>
																<c:if test="${field eq 'WEB'}">"자바 스크립트"</c:if>
																<c:if test="${field eq 'DataBase'}">"스토어드/프로시저와 함수"</c:if>,
																<c:if test="${field eq 'JAVA'}">"컬렉션 프레임워크"</c:if>
																<c:if test="${field eq 'WEB'}">"자바 스크립트"</c:if>
																<c:if test="${field eq 'DataBase'}">"스토어드/프로시저와 함수"</c:if>,
																<c:if test="${field eq 'JAVA'}">"컬렉션 프레임워크"</c:if>
																<c:if test="${field eq 'WEB'}">"자바 스크립트"</c:if>
																<c:if test="${field eq 'DataBase'}">"스토어드/프로시저와 함수"</c:if>
															],
															target: ${grade.set5/2 - 1},
															actual: ${grade.part5/2 - 1}
															},
															{
															name: "Part 6",
															range: [
																<c:if test="${field eq 'JAVA'}">"쓰레드/입출력/네트워크"</c:if>
																<c:if test="${field eq 'WEB'}">"JQuery 활용"</c:if>
																<c:if test="${field eq 'DataBase'}">"트리거/자동화"</c:if>,
																<c:if test="${field eq 'JAVA'}">"쓰레드/입출력/네트워크"</c:if>
																<c:if test="${field eq 'WEB'}">"JQuery 활용"</c:if>
																<c:if test="${field eq 'DataBase'}">"트리거/자동화"</c:if>,
																<c:if test="${field eq 'JAVA'}">"쓰레드/입출력/네트워크"</c:if>
																<c:if test="${field eq 'WEB'}">"JQuery 활용"</c:if>
																<c:if test="${field eq 'DataBase'}">"트리거/자동화"</c:if>,
																<c:if test="${field eq 'JAVA'}">"쓰레드/입출력/네트워크"</c:if>
																<c:if test="${field eq 'WEB'}">"JQuery 활용"</c:if>
																<c:if test="${field eq 'DataBase'}">"트리거/자동화"</c:if>,
																<c:if test="${field eq 'JAVA'}">"쓰레드/입출력/네트워크"</c:if>
																<c:if test="${field eq 'WEB'}">"JQuery 활용"</c:if>
																<c:if test="${field eq 'DataBase'}">"트리거/자동화"</c:if>
															],
															target: ${grade.set6/2 - 1},
															actual: ${grade.part6/2 - 1}
														}
													]
												});
											</script>
											<!-- 레이더차트 끝 -->
										</td>
										<th class="success text-center">Part</th>
										<th class="success text-center">
											나의 수준
											<span class="glyphicon glyphicon-question-sign" data-toggle="popover" title="현재 레벨의 학습 상태입니다." data-content="학습량과 정답률에 따라 점차적으로 증가합니다."></span>
										</th>
										<th class="success text-center">사용자 평균</th>
									</tr>
									
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">프로그래밍 기본</c:if>
											<c:if test="${field eq 'WEB'}">HTML 기본</c:if>
											<c:if test="${field eq 'DataBase'}">PL/SQL 기본</c:if>
										</td>
										<td class="text-center">${grade.part1}</td>
										<td class="text-center">${grade.set1}</td>
									</tr>
									
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">변수/연산자/조건문/반복문</c:if>
											<c:if test="${field eq 'WEB'}">선택자 지정</c:if>
											<c:if test="${field eq 'DataBase'}">SQL 고급 구문</c:if>
										</td>
										<td class="text-center">${grade.part2}</td>
										<td class="text-center">${grade.set2}</td>
									</tr>
									
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">객체지향 프로그래밍</c:if>
											<c:if test="${field eq 'WEB'}">CSS 스타일</c:if>
											<c:if test="${field eq 'DataBase'}">테이블과 뷰</c:if>
										</td>
										<td class="text-center">${grade.part3}</td>
										<td class="text-center">${grade.set3}</td>
									</tr>
									
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">예외처리/패키지와 클래스</c:if>
											<c:if test="${field eq 'WEB'}">Bootstrap</c:if>
											<c:if test="${field eq 'DataBase'}">인덱스 활용</c:if>
										</td>
										<td class="text-center">${grade.part4}</td>
										<td class="text-center">${grade.set4}</td>
									</tr>
									     
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">컬렉션 프레임워크</c:if>
											<c:if test="${field eq 'WEB'}">자바 스크립트</c:if>
											<c:if test="${field eq 'DataBase'}">스토어드/프로시저와 함수</c:if>
										</td>
										<td class="text-center">${grade.part5}</td>
										<td class="text-center">${grade.set5}</td>
									</tr>
									     
									<tr>
										<td class="text-center">
											<c:if test="${field eq 'JAVA'}">쓰레드/입출력/네트워크</c:if>
											<c:if test="${field eq 'WEB'}">JQuery 활용</c:if>
											<c:if test="${field eq 'DataBase'}">트리거/자동화</c:if>
										</td>
										<td class="text-center">${grade.part6}</td>
										<td class="text-center">${grade.set6}</td>
									</tr>
 
									<tr>
										<td colspan="3"></td>
									</tr>
	        					</table>
        					</form>
    					</div>
				    </div>
				</div>
				<!-- 상단 패널 끝 -->	
				
				<!-- 하단 패널 -->
				<c:if test="${levels ne 0}">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h2 class="panel-title">실력진단내역</h2>
						</div>
						<div class="panel-body">
							<!-- 결과 -->
							<table class="table">
								<tr>
									<th class="active col-xs-6 text-left">${userInfo.nickname}님의 ${field} Lv.${levels} 실력 평가</th>
									<th class="success col-xs-6 text-left">코딩고 종합평가</th>
								</tr>
								<tr>
									<td class="text-left">${evalText1}으로 각 개념을 이해할 수 있습니다.</td>
									<td class="text-left">각 파트 별 ${evalText2} 요구 됩니다.</td>
								</tr>
								<tr>
									<td class="text-left">${evalText1}으로 코드를 작성 할 수 있습니다.</td>
									<td class="text-left">각 파트 별 ${evalText2} 요구 됩니다.</td>
								</tr>
								<tr>
									<td class="text-left">${evalText1}으로 응용이 가능합니다.</td>
								</tr>
								
								<tr>
									<td colspan="2"></td>
								</tr>
							</table>
							<!-- 결과 끝 -->
						</div>
					</div>
				</c:if>
				<!-- 하단 패널 끝 -->
				
			</div>
			<!-- 본문 끝 -->
					
		</div>
		<!-- 로우컨텐트 끝 -->	
	</div>
	<!-- 중앙 끝 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center">
		<p><b>© 2018 Coco Dingding. All Right Reserved.</b></p>
	</footer>
	<!-- 푸터 -->

</body>
</html>