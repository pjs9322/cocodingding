<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>관리자 페이지</title>
</head>

<body>
	<h4>관리자용 회원정보 수정</h4>
	<form action="/qboard/admin_modPro.me" method="post">
		<input type="text" name="id" value="${member.id}" required="required" readonly><br>
		<input type="password" name="password" placeholder="비밀번호" required="required"><br>
		<input type="password" name="passcheck" placeholder="비밀번호확인" required="required"><br>
		<input type="text" name="nickname" value="${member.nickname}" required="required"><br>
		<input type="text" name="email" value="${member.email}" required="required"><br>
		<input type="submit" value="등록">
		<input type="button" value="돌아가기" onclick ="history.back()">
	</form>
		
</body> 
</html>
