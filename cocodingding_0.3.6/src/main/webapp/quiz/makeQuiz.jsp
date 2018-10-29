<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>문제 추가하기</title>
</head>

<body>
	<form action="/qboard/quizInsert.qu" method="post">
		<input type="text" name="field" placeholder="분야" required="required">
		<input type="text" name="part" placeholder="파트" required="required">
		<input type="text" name="levels" placeholder="레벨" required="required">
		<br>
		<textarea name="document" placeholder="문제 본문" required="required"></textarea>
		<br>
		<textarea name="commentary" placeholder="문제 해설" required="required"></textarea>
		<br>
		<input type="text" name="choice1" placeholder="1번째 보기" required="required">
		<input type="radio" value="1" name="result" checked><br>
		<input type="text" name="choice2" placeholder="2번째 보기" required="required">
		<input type="radio" value="2" name="result"><br>
		<input type="text" name="choice3" placeholder="3번째 보기" required="required">
		<input type="radio" value="3" name="result"><br>
		<input type="text" name="choice4" placeholder="4번째 보기" required="required">
		<input type="radio" value="4" name="result"><br>
		<input type="submit" value="등록">
		<input type="button" value="돌아가기" onclick ="history.back()">
	</form>

</body> 
</html>
