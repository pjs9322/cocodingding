<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='http://fonts.googleapis.com/css?family=Vollkorn|Open+Sans:400,700' rel='stylesheet' type='text/css'>

	<!-- 자바,웹,DB영역에 필요한 네비게이션 바를 위한 스타일시트-->
	<link rel="stylesheet" href="/qboard/resources/css/reset1.css">

	<!-- 자바,웹,DB영역에 필요한 네비게이션 바를 위한 스타일시트-->
	<link rel="stylesheet" href="/qboard/resources/css/style1.css">

	<!--자바, 웹, DB영역에 들어가는 폴딩기능있는 페이지 css파일-->
	<link rel="stylesheet" href="/qboard/resources/css/reset.css">
	<!--자바, 웹, DB영역에 들어가는 폴딩기능있는 페이지 css파일-->
	<link rel="stylesheet" href="/qboard/resources/css/style.css">


	<!-- 자바, 웹, DB영역에 들어가는 폴딩기능있는 페이지, 네비게이션 바 2군데에 필요한 js파일 -->
	<script src="/qboard/resources/js/modernizr.js"></script>



	<title>문제 유형 선택</title>

	<style>
		header h1 {
			font-size: 4.5em;
		}

		h2 {
			text-align: center;
			color: white;
		}

		em {
			font-weight: bold;
		}

		.button {
			background-color: rgb(250, 79, 0);
			/* Green */
			border: none;
			color: white;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			margin-top: 15px;
			margin-left: 300px;
		}
		
		/* 각 영역 호버시 주는 호버 이펙트 스타일시트 */

		#item1 {
			opacity: 1;
			transition: .5s ease;
			backface-visibility: hidden;
		}

		.disable {
			transition: .5s ease;
			opacity: 1;
			transform: translate(0%, 0%);
			-ms-transform: translate(-50%, -50%);
			text-align: center;
		}

		.disable:hover {
			background-color: black;
		}

		.enable:hover {
			transition: all 0.5s ease-in-out;
			background-color: pink;
		}
		
		.cd-item{
		height:450px;
		}
		
		/*수동문제 레벨선택 버튼 스타일*/
		.buttons {
			background-color: rgb(22, 141, 177);
			color: white;
			padding: 16px;
			margin-top: 10px;
			font-size: 14px;
			border: none;
			cursor: pointer;
			border:1px solid white;
			width:10%;
		}
		
		/*수동문제 레벨선택 미사용버튼 스타일*/
		.buttons_unused {
			background-color: rgb(200, 200, 200);
			color: white;
			padding: 16px;
			margin-top: 10px;
			font-size: 14px;
			border: none;
			cursor: auto;
			border:1px solid white;
			width:10%;
		}
	</style>
</head>

<body>
	<div class="cd-main">
		<header>
			<h1>문제 선택(${field}) 페이지입니다.</h1>
			<nav class="cd-stretchy-nav">
				<a class="cd-nav-trigger" href="#0">
					Menu
					<span aria-hidden="true"></span>
				</a>

				<ul>
					<li>
						<a href="/qboard/user.me">
							<span>나의페이지</span>
						</a>
					</li>
					<li>
						<a href="/qboard/select.qu/JAVA" <c:if test="${field eq 'JAVA'}">class="active"</c:if>>
							<span>JAVA</span>
						</a>
					</li>
					<li>
						<a href="/qboard/select.qu/WEB" <c:if test="${field eq 'WEB'}">class="active"</c:if>>
							<span>WEB</span>
						</a>
					</li>
					<li>
						<a href="/qboard/select.qu/DataBase" <c:if test="${field eq 'DataBase'}">class="active"</c:if>>
							<span>DataBase</span>
						</a>
					</li>
					<li>
						<a href="/qboard/incorrectList.ic">
							<span>틀린문제</span>
						</a>
					</li>
					<li>
						<a href="/qboard/bookMarkList.bm">
							<span>북마크</span>
						</a>
					</li>
				</ul>

				<span aria-hidden="true" class="stretchy-nav-bg"></span>
			</nav>
		</header>
		
		<c:if test="${field eq 'JAVA'}">
			<c:set var="levels" value="${userInfo.java}" />
		</c:if>
		<c:if test="${field eq 'WEB'}">
			<c:set var="levels" value="${userInfo.web}" />
		</c:if>
		<c:if test="${field eq 'DataBase'}">
			<c:set var="levels" value="${userInfo.database}" />
		</c:if>
		
		<ul class="cd-gallery">
			<li class="cd-item">
				<c:if test="${levels eq 0}">
					<a href="/qboard/selectMenu.qu/1/${field}">
						<div class="enable">
							<h2>실력 진단</h2>
							<p>실력진단을 보셔야 나머지 탭을 클릭하실 수 있습니다.</p>
							<b>시작하기</b>
						</div>
					</a>
				</c:if>
				<c:if test="${levels ne 0}">
					<span>
						<div class="disable">
							<h2>실력 진단</h2>
							<p>실력진단을 보셔야 나머지 탭을 클릭하실 수 있습니다.</p>
							<b>실력진단을 완료하셨습니다.</b>
						</div>
					</span>
				</c:if>
			</li>

			<li class="cd-item">
				<c:if test="${levels ne 0}">
					<a href="/qboard/selectMenu.qu/2/${field}">
						<div class="enable">
							<h2>레벨업 테스트</h2>
							<p>테스트를 통해 다음 레벨에 도전하실 수 있습니다.</p>
							<b>시작하기</b>
						</div>
					</a>
				</c:if>
				<c:if test="${levels eq 0}">
					<span>
						<div class="disable">
							<h2>레벨업 테스트</h2>
							<p>테스트를 통해 다음 레벨에 도전하실 수 있습니다.</p>
							<b>실력진단을 완료해야 이용하실 수 있습니다.</b>
						</div>
					</span>
				</c:if>
			</li>

			<li class="cd-item">
				<c:if test="${levels ne 0}">
					<a href="/qboard/selectMenu.qu/3/${field}">
						<div class="enable">
							<h2>자동 문제</h2>
							<p>자기 수준에 맞는 문제가 출제되고
								<br> 문제풀이시 '학습 그래프에 반영'됩니다.</p>
							<b>시작하기</b>
						</div>
					</a>
				</c:if>
				<c:if test="${levels eq 0}">
					<span>
						<div class="disable">
							<h2>자동 문제</h2>
							<p>자기 수준에 맞는 문제가 출제되고
								<br> 문제풀이시 '학습 그래프에 반영'됩니다.</p>
							<b>실력진단을 완료해야 이용하실 수 있습니다.</b>
						</div>
					</span>
				</c:if>
			</li>

			<li class="cd-item">
				<c:if test="${levels ne 0}">
					<a href="/qboard/selectMenu.qu/4/${field}">
						<div class="enable">
							<h2>수동 문제</h2>
							<p>원하는 레벨의 문제를 풀 수 있습니다.</p>
							<b>시작하기</b>
						</div>
					</a>
				</c:if>
				<c:if test="${levels eq 0}">
					<span>
						<div class="disable">
							<h2>수동 문제</h2>
							<p>원하는 레벨의 문제를 풀 수 있습니다.</p>
							<b>실력진단을 완료해야 이용하실 수 있습니다.</b>
						</div>
					</span>
				</c:if>
			</li>
		</ul>
		<!-- .cd-gallery -->
	</div>
	<!-- .cd-main -->

	<div class="cd-folding-panel">

		<div class="fold-left"></div>
		<!-- this is the left fold -->

		<div class="fold-right"></div>
		<!-- this is the right fold -->

		<div class="cd-fold-content">
			<!-- content will be loaded using javascript -->
		</div>

		<a class="cd-close" href="#0"></a>
	</div>
	<!-- .cd-folding-panel -->


	<!-- 네비게이션바 스크립트파일 -->
	<script src="/qboard/resources/js/jquery-2.1.4.js"></script>
	<script src="/qboard/resources/js/main1.js"></script>

	<!-- 폴딩페이지 스크립트파일 -->
	<script src="/qboard/resources/js/jquery-2.1.1.js"></script>
	<script src="/qboard/resources/js/main.js"></script>



	
</body>

</html>