<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>문제 수정하기</title>
</head>

<body>
	<form action="/qboard/updateQuiz.qu/${quiz.qnum}" method="post">
		<input type="text" name="field" value="${quiz.field}" required="required">
		<input type="text" name="part" value="${quiz.part}" required="required">
		<input type="text" name="levels" value="${quiz.levels}" required="required">
		<br>
		<textarea name="document" required="required">${quiz.document}</textarea>
		<br>
		<textarea name="commentary" required="required">${quiz.commentary}</textarea>
		<br>
		<% String result = (String) request.getAttribute("result"); %>
		<input type="text" name="choice1" value="${quiz.choice1}" required="required">
		<input type="radio" value="1" <%=("1".equals(result))?"checked":""%> name="result"><br>
		<input type="text" name="choice2" value="${quiz.choice2}" required="required">
		<input type="radio" value="2" <%=("2".equals(result))?"checked":""%> name="result"><br>
		<input type="text" name="choice3" value="${quiz.choice3}" required="required">
		<input type="radio" value="3" <%=("3".equals(result))?"checked":""%> name="result"><br>
		<input type="text" name="choice4" value="${quiz.choice4}" required="required">
		<input type="radio" value="4" <%=("4".equals(result))?"checked":""%> name="result"><br>
		<input type="submit" value="등록">
		<input type="button" value="돌아가기" onclick ="history.back()">
	</form>

</body> 
</html>
