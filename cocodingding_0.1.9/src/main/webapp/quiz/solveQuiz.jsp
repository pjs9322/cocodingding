<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>makeQuiz</title>
	<script type="text/javascript" src="./resources/script.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.js">	
	</script>
	
	<!-- 스타일 구성 -->
	<!-- 초기화 -->
	<style>
		* {
			margin: 0; padding: 0;
			font-family: '맑은 고딕', 'Malgun Gothic', Gothic, sans-serif;
		}
		
		a { text-decoration: none;}
		li { list-style: none;}
	</style>
	
	<!-- 1. 기본 클래스 -->
	<style>
		.pull-left {float: left;}
		.pull-right {float: right;}
	</style>
	
	<!-- 2. 페이지 구성 -->
	<style>
		body{
			width: 1200px; margin: 0 auto;
			background: black;
		}
		#page-wrapper {
			background: white;
			margin: 40px 0; padding: 10px 20px;
			border-radius: 0px;
			box-shadow: 0 2px 6px rgba(100, 100, 100, 0.3);
		}
	</style>

	<!-- 3. 헤더 구성 -->
	<style>
		#main-header { 
			padding: 10px 50px;
			background: #96ddff;
			border-radius: 15px;
		}
		.master-title {
			font-size: 40px;
			color: black;
			text-align: right;
		}
		.master-description {	
			font-size: 20px;
			font-weight: 500;
			padding-left: 10px;
			color: #adadad;
			text-align: right;
		}
	</style>

	<!-- 4. 내비게이션 구성 -->
	<style>
		#main-navigation {
			border-bottom: 3px solid #C8C8C8;
			margin-bottom: 20px;
			height: 60px;
			position: center;
		}
		
		.outer-menu-align {
			width: 240px;
			height: 50px;
			color: black;
			text-align: center;
			font-size: 40px;
		}
	</style>
	
	<!-- 5. 섹션 전체 -->
	<style>
		/*body 태그의 너비: 1500px*/
		#content {overflow: hidden;}
		
		#main-section {
			float: left;
			width: 750px;
		}
		
		#main-aside {
			float: right;
			width: 360px;
		}
	</style>
	
	
	<!-- 6.섹션 세부 -->
	<style>
		.section {
			height: 600px;
			width: 730px;
			padding: 0 10px 20px 10px;
			border-bottom: 3px solid #C8C8C8;
			margin: 0 30px 0 20px;
			background: #96ddff;
			border-radius: 15px;
		}
		
		#section-header {
			width: 400px;
			height: 50px;
			margin: 0px 0px 20px 0px;
		}
		
		.section-header-title {
	        width: 150px;
	        height: 50px;
	        float: left;
	        margin: 5px;
	        background-color: #2195c9;
	        border-radius: 15px;
		}
		
		.section-header-text {
			font-size: 30px;
			font-weight: 500;
			color: white;
			text-align: center;
		}
			
		.section-body {
			padding-left: 10px;
		}
		
		.section-body-main {
			font-size: 15px;
			padding-left: 10px;
		}
		
		.section-body-quiz{
			margin: 20px;
			width: 650px;
	        height: 250px;
	        border: solid 2px;
	        overflow-y: scroll;
	        border-color: #2195c9;
	        display: block;
		}
		
		.section-body-comment{
			margin: 20px;
			width: 750px;
	        height: 250px;
	        border: solid 2px;
	        overflow-y: scroll;
	        border-color: #2195c9;
	        display: none;
		}
		
		.section-body-sub {
			width: 500px;
			height: 100px;
	        margin: 20px;
		}
		
		.selecter {
			width: 300px;
			margin: 20px;
		}
		
		.section-number {
			width: 30px;
	        height: 30px;
	        float: left;
	        margin: 0px 30px 0px 0px;
	        background-color: #ffae35;
	        border-radius: 15px;
	        text-align: center;
	        line-height: 30px;
		}
		
		.section-text {
			width: 200px;
			height: 30px;
		}
		
		.section-radio {
			width: 20px;
	        height: 20px;
	        float: right;
	        margin: 5px 0px 0px 0px;
		}
	</style>
	
	<!-- 7.본문 추가(사이드 메뉴) -->
	<style>
		#main-aside {
			height: 480px;
			margin: 10px 10px 10px 10px;
			background: #96ddff;
			width: 340px;
			padding: 10px;
			border-radius: 15px;
		}
		
		.aside-list { 
			height: 300px;
			background: white;
			border-radius: 15px;
		}
			
		#aside-title {
			margin: 10px;
			padding: 10px;
		}
		
		.aside-number {
			width: 100px;
	        height: 50px;
	        float: left;
	        margin: 25px 30px 0px 35px;
	        background-color: #2195c9;
	        border-radius: 15px;
	        text-align: center;
	        line-height: 50px;
		}
		
		.aside-select {
			width: 100px;
	        height: 30px;
	        margin: 35px;
            float: auto;
		}
        
        #aside-control{
            
        }
        
        .aside-button {
            width: 280px;
	        height: 60px;
	        margin: 25px;
	        background-color: #ffae35;
	        border-radius: 15px;
	        text-align: center;
	        line-height: 60px;
        }
        
	</style>
	
	
	<!-- 8. 푸터 -->
	<style>
		#main-footer {
			font-size: 20px;
			text-align: right;
		}
	</style>
	
	<!-- 9. 문제/해설 타이틀 설정 -->
	<script>
	  var container = document.querySelector('#container');
	  var msnry = new Masonry( container, {
	    // options
	    columnWidth: 100,
	    itemSelector: '.section-header',
	  });
	</script>
</head>

<body> 
<div id="page-wrapper">
	
		<!-- 헤더 -->
		<header id="main-header">
			<hgroup>
				<h1 class="master-title">logo</h1>
				<h2 class="master-description">Coco Dingding</h2>
			</hgroup>
		</header>
		
		<!-- 네비게이션 -->
		<nav id="main-navigation">
			<div class="outer-menu-align">
				문제 추가
			</div>
		</nav>
		
		<!-- 섹션 -->
		<form action="/qboard/check.qu" method="post" id="quizform">
		<div id="content">
			<section id="main-section"><!-- 섹션 본문-->
					<section class="section">
						<div id="section-header">
							<div class="section-header-title">
								<h1 class="section-header-text">문제</h1>
							</div>
							<div class="section-header-title">
								<h1 class="section-header-text">해설</h1>
							</div>
						</div>
						<div class="section-body">
							<div class="section-body-main">
								<textarea class="section-body-quiz" readOnly>
	[스포탈코리아] 김성진 기자= 토트넘 홋스퍼가 예상보다 빨리 손흥민(26)을 아시안게임 대표팀에 보내주기로 했다. 대한축구협회와 주고받는 거래가 있었지만, 분명한 것은 토트넘도 손흥민이 아시안게임 금메달을 목에 걸기 바라고 있는 것이다.
	손흥민의 2018 자카르타-팔렘방 아시안게임 합류 시기가 확정됐다. 손흥민은 8월 11일 뉴캐슬 유나이티드와의 2018/2019 잉글랜드 프리미어리그 개막전을 치른 뒤 자카르타로 이동해 합류한다. 스케줄상 8월 15일 UAE와의 아시안게임 조별리그 2차전부터 가능하다.
	당초 토트넘은 8월 18일 풀럼전까지 치른 뒤 보내주려고 했었다. 토트넘 입장에서도 주전 공격수를 최대한 활용해야 하기 때문이다. 이 경우에는 사실상 아시안게임 조별리그 일정은 소화할 수 없게 된다.
	아시안게임은 차출 의무가 없기 때문에 토트넘이 응하더라도 이러한 스케줄이 합리적으로 여겼다. 그러나 토트넘은 예상보다 일주일이나 빨리 차출에 응하기로 했다. 손흥민의 요청사항도 있지만, 토트넘의 빠른 계산도 한 몫 했다. 토트넘으로서도 손흥민이 금메달을 목에 걸고 돌아와야 하기 때문이다.
								</textarea>
								<textarea class="section-body-comment">
	해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설
	해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설
	해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설해설
								</textarea>
							</div>
						</div>
						<div class="section-body-sub">
							<div class="selecter">
								<div class="section-number"><h4>1</h4></div>
								<input type="text" class="section-text" id="number1" name="number1">
								<input type="radio" class="section-radio" id="number1" value="1" name="select">
							</div>
							<div class="selecter">
								<div class="section-number"><h4>2</h4></div>
								<input type="text" class="section-text" id="number2" name="number2">
								<input type="radio" class="section-radio" id="number2" value="2" name="select">
							</div>
							<div class="selecter">
								<div class="section-number"><h4>3</h4></div>
								<input type="text" class="section-text" id="number3" name="number3">
								<input type="radio" class="section-radio" id="number3" value="3" name="select">
							</div>
							<div class="selecter">
								<div class="section-number"><h4>4</h4></div>
								<input type="text" class="section-text" id="number4" name="number4">
								<input type="radio" class="section-radio" id="number4" value="4" name="select">
							</div>
							
						
						</div>
					</section>
			</section>
			<section id="main-aside"><!-- 본문 사이드 -->
				<div class="aside-list">
				
						<table>
							<tr id="tr_top">
								<td>번호</td>
								<td>정답</td>
								<td>장바구니</td>
							</tr>
							<c:forEach var="item" items="${quizCheck}">
							  <tr class="tr_body">
							    <td>${item.qnum}</td>
							    <td>${item.select}</td>
							    <td>담기</td>
							  </tr>
							</c:forEach>
						</table>
					
				</div>
				<div id="aside-control">
					<div class="aside-button">
						<div id="aside-resist" onclick="document.getElementById('quizform').submit()"><h3>다음문제</h3></div>
					</div>
					<div class="aside-button">
						<div id="aside-back" onclick="location.href = '/qboard/user.me'"><h3>학습종료</h3></div>
					</div>
				</div>
			</section>
		</div>
		</form>
		
		<!-- 푸터 -->
		<footer id="main-footer">
			<a href="#">Created by Coco Dingding</a>
		</footer>
	
	</div>
</body> 
</html>
