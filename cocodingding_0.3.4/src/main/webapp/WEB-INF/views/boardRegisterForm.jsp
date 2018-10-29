<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 쓰기</title>
</head>
<body>
	<h1>Board Register</h1>
	<c:url var="insertUrl" value="./boardInsert.do" />
	<form:form commandName="boardVO" action="${insertUrl}" name="boardVO" method="post">
	<table>
	<tbody>
	<tr>
	   <th>이름</th>
	   <td><form:input path="name" id="name" size="20" maxlength="20" /></td>
	</tr>
	<tr>
	   <th>제목</th>
	   <td><form:input path="title" id="title" size="20" maxlength="20" /></td>
	</tr>
	<tr>
	   <th>내용</th>
	   <td><form:textarea path="content" id="content" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등록" /></td>
	</tr>
	</tbody>
	</table>
	</form:form>
</body>
</html>
