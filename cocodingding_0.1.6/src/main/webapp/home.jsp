<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인 페이지 입니다.</title>
	<script type="text/javascript" src="/qboard/resources/script.js"></script>

	<style>
		#header {
			height: 50px;
			border: 1px solid;
		}

		#title {
			text-align: center;
			font-size: 50px;
			border: 1px solid;
			margin-top: -30px;
		}

		#contents {
			text-align: center;
			font-size: 200%;
			padding-top: 40px;
			border: 1px solid;
		}

		input[type=button] {
			float: right;
			width: 100px;
			height: 30px;
			line-height: 30px;
			background: dodgerblue;
			border: none;
			color: white;
			margin-top: 13px;
			margin-left: 10px;
			border: 1px solid;
		}
	</style>
</head>

<body>

	<div id="wrap">
		<div id="header">
			<div class="button">
				<form>
					<input type="button" value="로그인" onclick="location.href='/qboard/loginForm.me'">
					<input type="button" value="회원가입" onclick="location.href='/qboard/joinForm.me'">
				</form>
			</div>
		</div>
		<div id="title">
				<h1>코코딩딩</h1>
		</div>
	</div>

	<div id="contents">
		<p>학습 패러다임의 변화를 꿈꾸다.<br><br>
		국내 최초 인공지능형 프로그래밍 문제풀이 학습 서비스</p>
	</div>

</body>

</html>
