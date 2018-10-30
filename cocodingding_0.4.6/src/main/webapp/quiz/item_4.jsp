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

	<title>수동 문제 페이지</title>
</head>

<body>
	<div class="cd-fold-content single-page">
		<h2 style="color:black">수동 문제 안내</h2>
		<br>
		<br>
		<br>
		<em>본 페이지는 학습자가 원하는 수준의 문제들을 레벨별로 선택해서 <br>
			풀 수 있는 페이지입니다.</em>
		<br>
		<br>
		<br>
		<p>
			1. 수동 문제는 lv1부터 lv10까지 자유롭게 선택 가능합니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			2. 수동으로 문제를 푼 경우에 학습 결과가 그래프에 반영되지 않습니다.
			<br> &nbsp;&nbsp;&nbsp; 그래프 반영을 원할 시 자동 문제를 풀어주세요.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			3. 틀린 문제는 자동으로 '틀린문제 탭'에 저장되어 원하는 때에 다시 볼 수 있습니다.
		</p>
		<br>
		<br>
		<br>
		<br>
		<p>
			4. 문제 담기에 체크하면 '장바구니 탭'에 저장되어 원하는 때에 다시 볼 수 있습니다.
		</p>
		<br>
		<br>
		<br>
		<p>
			5. 제출하기를 누르면 결과페이지로 이동합니다.
		</p>
			<button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/1/0'">레벨1</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/2/0'">레벨2</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/3/0'">레벨3</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/4/0'">레벨4</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/5/0'">레벨5</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/6/0'">레벨6</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/7/0'">레벨7</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/8/0'">레벨8</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/9/0'">레벨9</button>
            <button type="button" class="button" onclick="location.href='/qboard/study.qu/${field}/10/0'">레벨10</button>   
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