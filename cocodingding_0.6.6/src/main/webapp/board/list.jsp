<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">
<head>

	<title>게시판</title>
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
			
			var frm	= document.BoardListform;
			
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
			var frm	= document.BoardListform;
			
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
					<li><a href="#">블로그</a></li>
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
	
<form action ="/qboard/boardList.bo/${type}" method="get" name="BoardListform">
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
						<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#modMember" data-backdrop="static" data-keyboard="false">회원정보수정</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/my'">나의 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/ask'">질문 게시판</button>
						</c:if>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href = '/qboard/boardList.bo/all'">전체 게시판</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 본문 -->
			<div class="col-lg-10 text-left"> 
			
				<!--패널 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
					    <h2 class="panel-title">게시판 - 리스트</h2>
					</div>
					<!-- 바디패널 -->
					<div class="panel-body">
						<!-- 게시판 -->
						<div class="col-lg-12">
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
									</div>
									<div>
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th width="10%">글번호</th>
													<th width="10%">분야</th>
													<th width="40%">제목</th>
													<th width="10%">작성자</th>
													<th width="10%">조회</th>
													<th width="20%">날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${list}" begin="${pageVO.curStartNumber}" end="${pageVO.curEndNumber}" varStatus="status">
													<tr>
														<td>${item.curNumber}</td>
													    <td>${item.field}</td>
													    <td>
													    	<a href="/qboard/boardView.bo/${item.bnum}">${item.title}</a>
													    </td>
												    <td>${item.id}</td>
												    <td>${item.views}</td>
												    <td>${item.bdate}</td>
												  </tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div id="write">
									<a href="/qboard/boardWriteForm.bo">글쓰기</a>
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
										<input style="font-weight:bold;" type="button" value="${pageNum}" onclick="paging('${pageNum}')">
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
								<div class="col-lg-4">
								<table>
									<thead>
										<tr>
											<th>
												<input type="checkbox" id="checkAll" <c:if test="${java and web and db}">checked</c:if>>
											</th>
											<td>전체선택</td>
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
								<div class="col-lg-8">
									<div class="input-group">
										<select name="opt">
											<option value="0" <c:if test="${opt eq 0}">selected</c:if>>제목</option>
											<option value="1" <c:if test="${opt eq 1}">selected</c:if>>글쓴이</option>
											<option value="2" <c:if test="${opt eq 2}">selected</c:if>>내용</option>
										</select>
											<input type="text" size="20" name="condition" value="${condition}">&nbsp;
											<input type="submit" value="검색"/>
									</div>
								</div>
								<!-- 게시판 검색 란 끝 -->
							</div>
							<!-- 게시판 하단 끝 -->
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

 
