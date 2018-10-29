<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>로그인 페이지입니다.</title>
	<script type="text/javascript" src="/qboard/resources/script.js"></script>
	
	<style>
		#container {
			margin: auto;
			width: 350px;
		}

		#container h1 {
			text-align: center;
		}

		#contents {
			width: 350px;
			margin: auto;
		}

		#contents input[type="text"],
		#contents input[type="password"] {
			border: 1px solid #ccc;
			padding: 3px;
			margin-bottom: 15px;
			font-size: 13pt;
		}

		#left_bar {
			overflow: hidden;
			width: 230px;
		}

		#join,
		#find,
		#back {
			width: 100px;
			height: 30px;
			line-height: 30px;
			background: dodgerblue;
			border: none;
			color: white;
			float: left;
			margin-top: 13px;
		}

		#right_bar {
			width: 100px;
			float: right;
		}

		#right_bar hr {
			width: 100%;
		}

		#login {
			width: 100px;
			height: 70px;
			line-height: 30px;
			background: dodgerblue;
			border: none;
			color: white;
			font-size: 20px;
		}

		#bottom_bar {
			display: inline;
			float: left;
			border: 1px solid;
		}
	</style>
</head>

<body>

	<!-- container div-->
	<div id="container">
		<h1>로그인</h1>
		<hr />
		<form action="/qboard/loginPro.me" method="post">
			<!-- contents div-->
			<div id="contents">
			
				<div id="right_bar">
					<input type="submit" id="login" value="로그인">
					<input type="button" id="join" value="회원가입" onclick="location.href='/qboard/joinForm.me'">
					<input type="button" id="find" value="계정찾기" onclick="location.href='/qboard/findForm.me'">
					<input type="button" id="back" value="돌아가기" onClick ="history.back()">
				</div>
				<div id="left_bar">
					<input type="text" placeholder="아이디를 입력하세요" name="id" required="required">
					<input type="password" placeholder="비밀번호를 입력하세요" name="password" required="required">
					<br> 아직 회원이 아니신가요?<br>
					<br> 아이디/패스워드를 잊으셨나요?<br>
					<br> 메인 페이지로 돌아갑니다.
				</div>

			</div>
			<!-- contents div-->
		</form>
	</div>
	<!-- container div-->

</body>
<html>
