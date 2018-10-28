<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>게시판글수정</h2>
		<form action="/qboard/boardUpdate.bo/${bnum}" method="post" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="id">글쓴이</label></td>
					<td class="td_right">
						<input type="text" name="id" required="required" value="${article.getId()}" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="field">분야</label></td>
					<td class="td_right">
						<input type="text" name="field" required="required" value="${article.getField()}" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="title">제 목</label></td>
					<td class="td_right">
						<input type="text" name="title" required="required" value="${article.getTitle()}" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="document">내 용</label></td>
					<td>
						<textarea cols="40" rows="15" name="document" required="required">${article.getDocument()}</textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" />
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>