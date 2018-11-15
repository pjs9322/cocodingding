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

	<title>자동 문제 페이지</title>
</head>

<body>
	<div class="cd-fold-content single-page">
		<h2 style="color:black">자동 문제 안내</h2>
		<br>
		<em>본 페이지는 학습자 수준에 맞는 문제들이 랜덤으로 출제되는 페이지입니다.</em>
		<br>
		<p>
			1. 자동 문제는 자기 레벨의 ±1 구간에서 출제됩니다.
		</p>
		<br>
		<p>
			2. 자동 문제를 풀면 학습 그래프에 반영되어 자신의 수준을 객관적으로 알 수 있습니다. 
		</p>
		<br>
		<p>
			3. 틀린 문제는 자동으로 '틀린문제 탭'에 저장되어 원하는 때에 다시 볼 수 있습니다.
		</p>
		<br>
		<p>
			4. 문제 담기에 체크하면 '북마크 탭'에 저장되어 원하는 때에 다시 볼 수 있습니다.
		</p>
		<br>
		<p>
			5. 제출하지 않고 페이지를 나갈 시 학습 그래프에 결과가 반영되지 않습니다.
			꼭 제출하기 버튼을 눌러주세요.
		</p>
		<br>
		<br>
		<br>
		<p>
			6. 제출하기를 누르면 결과페이지로 이동합니다.
		</p>
		<button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/1/0'">시작하기</button>
		<br>
	</div>
	
<script src="/qboard/resources/js/jquery-2.1.1.js"></script>
<script src="/qboard/resources/js/main.js"></script>
<!-- Resource jQuery -->

</body>

</html>