<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>문제 풀기</title>
	<script type="text/javascript">
		function goData(){
		    document.quizform.submit();
		}
	</script>
</head>

<body>
	<h4>${code+1}번 문제입니다.</h4>
	<form action="/qboard/diagno.qu/${code}" method="post" name="quizform">
		<input type="hidden" name="qnum" value="${testQuiz.get(code).qnum}">
		<input type="hidden" name="field" value="${testQuiz.get(code).field}">
		<input type="hidden" name="part" value="${testQuiz.get(code).part}">
		<input type="hidden" name="levels" value="${testQuiz.get(code).levels}">
		${testQuiz.get(code).field}
		${testQuiz.get(code).part}
		${testQuiz.get(code).levels}
		<br>
		<textarea name="document" readOnly>${testQuiz.get(code).document}</textarea>
		<br>
		<textarea name="commentary" readOnly>${testQuiz.get(code).commentary}</textarea>
		<br>
		<% String result = (String) request.getAttribute("result"); %>
		<input type="hidden" name="choice1" value="${testQuiz.get(code).choice1}">
		${testQuiz.get(code).choice1}
		<input type="radio" value="1" <%=("1".equals(result))?"checked":""%> name="result" onclick="goData();">
		<br>
		<input type="hidden" name="choice2" value="${testQuiz.get(code).choice2}">
		${testQuiz.get(code).choice2}
		<input type="radio" value="2" <%=("2".equals(result))?"checked":""%> name="result" onclick="goData();">
		<br>
		<input type="hidden" name="choice3" value="${testQuiz.get(code).choice3}">
		${testQuiz.get(code).choice3}
		<input type="radio" value="3" <%=("3".equals(result))?"checked":""%> name="result" onclick="goData();">
		<br>
		<input type="hidden" name="choice4" value="${testQuiz.get(code).choice4}">
		${testQuiz.get(code).choice4}
		<input type="radio" value="4" <%=("4".equals(result))?"checked":""%> name="result" onclick="goData();">
		<br>
		<input type="button" value="이전 문제" onclick ="location.href = '/qboard/diagno.qu/${code-1}'">
		<input type="button" value="다음 문제" onclick ="location.href = '/qboard/diagno.qu/${code+1}'">
		<input type="button" value="학습 끝내기" onclick ="location.href = '/qboard/complete.qu/'">
		<table>
			<tr id="tr_top">
				<td>번호</td>
				<td>정답</td>
				<td>장바구니</td>
			</tr>
			<c:forEach var="item" items="${testQuiz}" varStatus="status">
			<tr class="tr_body">
				<td>
					<a href="/qboard/diagno.qu/${status.index}">${status.count}</a>
				</td>
				<td>${item.result}</td>
				<td>담기</td>
			</tr>
			</c:forEach>
		</table>
	</form>
	
</body> 
</html>
