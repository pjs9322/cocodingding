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
		
			frm.submit();
		}
	</script>
	
	<script type="text/javascript">

		function paging(num) {
			var frm	= document.BoardListform;
			
			document.getElementsByName("page").value = num;
			
			frm.submit();
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
	    
	    /* 사이드 */
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
				<a class="navbar-brand" href="#">Logo 자리</a>
			</div>
			<!-- 네비 로고 끝 -->
			
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 - 카테고리- -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">나의 페이지</a></li>
					<li><a href="#">실력진단</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">JAVA<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WEB<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DataBase<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">문제풀기</a></li>
							<li><a href="#">레벨 업 테스트</a></li>
						</ul>
					</li>
					<li><a href="">틀린문제</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="#">나의 블로그</a></li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				
				<!-- 네비 - 우측 -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/qboard/logoutPro.me"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li> 
				</ul>
				<!-- 네비 우측 끝 -->
			</div>
		</div>
	</nav>
	<!-- 네비게이션 끝 -->
<form action ="/qboard/boardList.bo/${type}" method="get" name="BoardListform">
	<!-- 섹션 -->
	<div class="container text-center">  
		<!-- 로우 컨텐트 -->
		<div class="row content">
		
			<!-- 왼쪽 사이드바 -->
			<div class="col-lg-2 sidenav">
				<!-- 사이드바 랩. 감싸는부분 -->
				<div class="">
					<!-- 사이드 사진 -->
					<div class="">
						<img class="img-responsive" src="./resources/admin.png" > 
					</div>
					<!-- 사이드 사진 끝 -->
					<!-- 사이드 사용자 정보 -->
					<div class="">
						<h4>${'userinfo.id'}님 환영합니다.</h4>
						<h4>JAVA LV.3</h4>
						<h4>WEB LV.3</h4>
						<h4>DataBase LV.3</h4>
					</div>
					<!-- 사이드 사용자정보 끝 -->

					<!-- 사이드 게시판목록 -->
					<div class="">
							<button type="button" class="btn btn-primary btn-lg btn-block">회원정보수정</button>
						<button type="button" class="btn btn-default btn-lg btn-block"
						 onclick="location.href = '/qboard/boardList.bo/my'">나의 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block"
						 onclick="location.href = '/qboard/boardList.bo/ask'">질문 게시판</button>
						<button type="button" class="btn btn-default btn-lg btn-block"
						 onclick="location.href = '/qboard/boardList.bo/all'">전체 게시판</button>
					</div>
					<!-- 사이드 게시판목록 끝 -->
				</div>
				<!-- 사이드바 랩 끝 -->
			</div>
			<!-- 왼쪽 사이드바 끝 -->
			
			<!-- 본문 -->
			<div class="col-lg-10 text-left"> 
				<!-- 본문 랩. 감싸는부분 -->
				<div class="">
					<!-- 본문 상단 -->
					<div class="">
						<h2>게시판 페이지</h2>
						<h4>궁금한 내용은 질문게시판을 이용하세요!</h4>
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
											<th width="10%">글번호</th>
											<th width="10%">분야</th>
											<th width="40%">제목</th>
											<th width="10%">작성자</th>
											<th width="10%">조회</th>
											<th width="20%">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list}" begin="${pageVO.curStartNumber}" end="${pageVO.curEndNumber}"  >
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
						
						<input type="text" name="page" value="${pageVO.curPage}">

						<!-- 게시판 하단 페이지네이션 -->
						<!-- 페이지 이동부분 -->
						<nav>
							<ul class="pageVO">
								<c:if test="${pageVO.curRange ne 1 }">
								<a href="" onClick="paging(1)">[처음]</a> 
								</c:if>
								<c:if test="${pageVO.curPage ne 1}">
								<a href="" onClick="paging('${pageVO.prevPage}')">[이전]</a> 
								</c:if>
								<c:forEach var="pageNum" begin="${pageVO.startPage}" end="${pageVO.endPage}">
								<c:choose>
								<c:when test="${pageNum eq pageVO.curPage}">
								<span style="font-weight: bold;"><a href="" onClick="paging('${pageNum}')">${pageNum}</a></span> 
								</c:when>
								<c:otherwise>
								<input type="button" value="${pageNum}" onclick="paging('${pageNum}')">
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pageVO.curPage ne pageVO.pageCnt && pageVO.pageCnt > 0}">
								<a onClick="paging('${pageVO.nextPage}')">[다음]</a> 
								</c:if>
								<c:if test="${pageVO.curRange ne pageVO.rangeCnt && pageVO.rangeCnt > 0}">
								<a onClick="paging('${pageVO.pageCnt}')">[끝]</a> 
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
									<option value="0">제목</option>
									<option value="1">글쓴이</option>
									<option value="2">내용</option>
								</select>
									<input type="text" size="20" name="condition"/>&nbsp;
									<input type="submit" value="검색"/>
							</div>
						</div>
						<!-- 게시판 검색 란 끝 -->
						<div>
						    총 게시글 수 : ${pageVO.listCnt } /    총 페이지 수 : ${pageVO.pageCnt } / 현재 페이지 : ${pageVO.curPage } / 현재 블럭 : ${pageVO.curRange } / 총 블럭 수 : ${pageVO.rangeCnt }
						</div>
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
	<footer class="container-fluid text-center">
		<p>Created by Coco Dingding</p>
	</footer>

</body>
</html>

 
