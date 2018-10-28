<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원정보 찾기 페이지입니다.</title>
	<script type="text/javascript" src="/qboard/resources/script.js"></script>
	
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

			<!-- contents div-->
			<div id="contents">
			
				<form action="/qboard/findIdPro.me" method="post">
					<div id="top">
							<input type="text" class="inpt" placeholder="이메일 주소를 입력하세요" name="email" required="required">
							<input type="submit" id="findId" value="아이디 찾기">
					</div>
				</form>
				<hr>
				<form action="/qboard/findPassPro.me" method="post">
				
					<div id="middle">
						<input type="text" class="inpt" placeholder="아이디를 입력하세요" name="id" required="required"><br>
						<input type="text" class="inpt" placeholder="이메일 주소를 입력하세요" name="email" required="required">
						<input type="submit" id="findPw" value="비밀번호 찾기"><br>
					</div>
					<div id="bottom">
						<input type="button" id="cancel" value="돌아가기" onClick ="history.back()">
					</div>

				</form>
			</div>
			<!-- contents div-->
	</div>
	<!-- container div-->

</body>
</html>