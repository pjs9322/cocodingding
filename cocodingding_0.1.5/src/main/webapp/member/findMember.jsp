<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원정보 찾기 페이지입니다.</title>
	<script type="text/javascript" src="./resources/script.js"></script>
	
	<style>
		#container {
			width: 300px;
			margin: auto;
		}

		#container h1 {
			text-align: center;
		}

		#container p {
			font-size: 10px;
			color: dodgerblue;
			text-align: center;
		}

		#findId,
		#findPw {
			width: 100px;
			height: 30px;
			line-height: 30px;
			background: dodgerblue;
			border: none;
			color: white;
			margin-top: 13px;
		}

		#findPw {
			margin-top: 0px;
		}

		.inpt{
			opacity: 0.8;
		}

		#bottom{
			width:100px;
			margin: auto;
			margin-top:10px;
		}

		#cancel {
			width: 100px;
			height: 30px;
			line-height: 30px;
			background: #ccc;
			border: none;
			color: white;
			text-align: center;
		}
	</style>
</head>

<body>
	<!-- container div-->
	<div id="container">
		<h1>회원정보 찾기</h1>
		<hr />

		<p> 가입하신 이메일주소를 입력해주세요.<br> 해당 이메일 주소로 가입정보를 보내드립니다.</p>

		<form action="login.do" method="post">
			<!-- contents div-->
			<div id="contents">
				<div id="top">
					<input type="text" class="inpt" placeholder="이메일 주소를 입력하세요">
					<input type="button" id="findId" value="아이디 찾기" onclick="move('./')">
				</div>
				<hr>
				<div id="middle">
					<input type="text" class="inpt" placeholder="아이디를 입력하세요"><br>
					<input type="password" class="inpt" placeholder="이메일 주소를 입력하세요" name="email">
					<input type="button" id="findPw" value="비밀번호 찾기" onclick="move('./')"><br>
				</div>
				<div id="bottom">
					<input type="button" id="cancel" value="돌아가기" onclick="move('./')">
				</div>

			</div>
			<!-- contents div-->
		</form>
	</div>
	<!-- container div-->

</body>
<html>
