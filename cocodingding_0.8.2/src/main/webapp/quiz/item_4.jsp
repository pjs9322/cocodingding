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
		<em>본 페이지는 학습자가 원하는 수준의 문제들을 레벨별로 선택해서 
			풀 수 있는 페이지입니다.</em>
		<br>
		<p>
			1. 수동 문제는 lv1부터 lv10까지 자유롭게 선택 가능합니다.
		</p>
		<br>
		<p>
			2. 수동으로 문제를 푼 경우에 학습 결과가 그래프에 반영되지 않습니다.
			 그래프 반영을 원할 시 자동 문제를 풀어주세요.
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
			5. 제출하기를 누르면 결과페이지로 이동합니다.
		</p>
		
		<c:if test="${field eq 'JAVA'}">
			<c:set var="levels" value="${userInfo.java}" />
		</c:if>
		<c:if test="${field eq 'WEB'}">
			<c:set var="levels" value="${userInfo.web}" />
		</c:if>
		<c:if test="${field eq 'DataBase'}">
			<c:set var="levels" value="${userInfo.database}" />
		</c:if>
		
		<button type="button" <c:if test="${levels lt 1}">class="buttons_unused"</c:if> <c:if test="${levels ge 1}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/1/0'"</c:if>>Lv1</button>
		<button type="button" <c:if test="${levels lt 2}">class="buttons_unused"</c:if> <c:if test="${levels ge 2}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/2/0'"</c:if>>Lv2</button>
		<button type="button" <c:if test="${levels lt 3}">class="buttons_unused"</c:if> <c:if test="${levels ge 3}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/3/0'"</c:if>>Lv3</button>
		<button type="button" <c:if test="${levels lt 4}">class="buttons_unused"</c:if> <c:if test="${levels ge 4}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/4/0'"</c:if>>Lv4</button>
		<button type="button" <c:if test="${levels lt 5}">class="buttons_unused"</c:if> <c:if test="${levels ge 5}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/5/0'"</c:if>>Lv5</button>
		<button type="button" <c:if test="${levels lt 6}">class="buttons_unused"</c:if> <c:if test="${levels ge 6}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/6/0'"</c:if>>Lv6</button>
		<button type="button" <c:if test="${levels lt 7}">class="buttons_unused"</c:if> <c:if test="${levels ge 7}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/7/0'"</c:if>>Lv7</button>
		<button type="button" <c:if test="${levels lt 8}">class="buttons_unused"</c:if> <c:if test="${levels ge 8}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/8/0'"</c:if>>Lv8</button>
		<button type="button" <c:if test="${levels lt 9}">class="buttons_unused"</c:if> <c:if test="${levels ge 9}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/9/0'"</c:if>>Lv9</button>
		<button type="button" <c:if test="${levels lt 10}">class="buttons_unused"</c:if> <c:if test="${levels ge 10}">class="buttons" onclick="location.href='/qboard/study.qu/${field}/10/0'"</c:if>>Lv10</button>
	</div>
	
<script src="/qboard/resources/js/jquery-2.1.1.js"></script>
<script src="/qboard/resources/js/main.js"></script>
<!-- Resource jQuery -->

</body>

</html>