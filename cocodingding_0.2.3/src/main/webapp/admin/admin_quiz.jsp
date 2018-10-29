<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>관리자 문제관리 페이지</title>
</head>

<body> 
	<a href="/qboard/admin.me">회원관리</a>
	<a href="/qboard/admin.qu">문제관리</a>
	<br>
	<h4>${userInfo.nickname} 님 환영합니다.</h4>
	<a href="/qboard/modForm.me">정보수정</a>
	<a href="/qboard/logoutPro.me">로그아웃</a>
	<br>
	<a href="/qboard/boardList.bo">게시판 관리</a>
	<br>
	<h5 class="article-title">문제관리 게시판</h5>
	<table>
		<tr id="tr_top">
			<td>순번</td>
			<td>분야</td>
			<td>파트</td>
			<td>레벨</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="item" items="${quiz}">
		  <tr class="tr_body">
		    <td>${item.qnum}</td>
		    <td>${item.field}</td>
		    <td>${item.part}</td>
		    <td>${item.levels}</td>
		    <td><a href="/qboard/modQuizForm.qu/${item.qnum}">수정</a></td>
		    <td><a href="/qboard/deleteQuiz.qu/${item.qnum}">삭제</a></td>
		  </tr>
		</c:forEach>
	</table>
	<a href="/qboard/makeQuizForm.qu">문제추가</a>
</body> 
</html>
