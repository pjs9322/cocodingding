<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="/qboard/resources/css/reset.css">
	<!-- CSS reset -->
	<link rel="stylesheet" href="/qboard/resources/css/style.css">
	<!-- Resource style -->
	<script src="/qboard/resources/js/modernizr.js"></script>
	<!-- Modernizr -->

	<title>실력진단 페이지</title>
</head>

<body>
	<div class="cd-fold-content single-page">
		<h2 style="color:black">실력진단 안내</h2>
		<br>
		<br>
		<br>
		<em>본 페이지는 회원님의 ${field} 실력을 진단해 초기 레벨을 정하는 페이지 입니다.</em>
		<br>
		<br>
		<br>
		<p>
			1. 실력진단은 회원가입 후 최초 1회만 진행되며, 실력진단 완료 후 다른 서비스를 이용가능하오니
			<br> &nbsp;&nbsp;&nbsp;&nbsp;반드시 실력진단을 진행해주시기 바랍니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			2. 맞춘 문항수에 따라 회원님의 레벨이 정해지게 됩니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			3. 문항수는 총 10문항이며 시간제한은 30분입니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			4. 문제를 다 풀지 않고 제출할 경우 틀린문제로 인식하게 되므로<br>
			&nbsp;&nbsp;&nbsp; 되도록이면 진단을 완료해주시기 바랍니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			5. 제출하기를 누르면 결과페이지로 이동합니다.
		</p>
		<button type="button" class="button" onclick="location.href='/qboard/diagno.qu/${field}/0'">시작하기</button>
		<br>
		<br>
		<br>
		<br>
	</div>
	
<script src="/qboard/resources/js/jquery-2.1.1.js"></script>
<script src="/qboard/resources/js/main.js"></script>
<!-- Resource jQuery -->

</body>

</html>