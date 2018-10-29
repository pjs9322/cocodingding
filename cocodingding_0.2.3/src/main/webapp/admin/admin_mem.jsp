<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>관리자 회원관리 페이지</title>
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
	<h5 class="article-title">회원관리 게시판</h5>
	<table>
		<tr id="tr_top">
			<td>아이디</td>
			<td>비밀번호</td>
			<td>닉네임</td>
			<td>이메일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="item" items="${member}">
		  <tr class="tr_body">
		    <td>${item.id}</td>
		    <td>${item.password}</td>
		    <td>${item.nickname}</td>
		    <td>${item.email}</td>
		    <td><a href="/qboard/admin_modForm.me/${item.id}">수정</a></td>
		    <td><a href="/qboard/admin_delete.me/${item.id}">삭제</a></td>
		  </tr>
		</c:forEach>
	</table>
		
</body> 
</html>
