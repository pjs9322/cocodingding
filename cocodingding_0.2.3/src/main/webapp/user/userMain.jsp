<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>일반 회원 페이지</title>
</head>

<body>
	<br>
	<h4>${userInfo.nickname} 님 환영합니다.</h4>
	<a href="/qboard/modForm.me">정보수정</a>
	<a href="/qboard/logoutPro.me">로그아웃</a>
	<br>
	<a href="/qboard/boardList.bo">게시판 가기</a>
	<br>
	<a href="/qboard/diagno.qu/0">실력진단</a>
	<a href="/qboard/study.qu/0">학습하기</a>
	<a href="/qboard/levelUp.qu/0">레벨업 테스트</a>

</body>
</html>
