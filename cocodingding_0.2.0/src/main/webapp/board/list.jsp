<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style type="text/css">
#registForm {
	width: 600px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 600px;
}

#tr_top {
	background: orange;
	text-align: center;	
}

.tr_body {
	text-align: center;	
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 리스트 -->

	<section id="listForm">
		<h2>
			게시판
		</h2>
		<table>
			<tr id="tr_top">
				<td>번호</td>
				<td>분야</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회</td>
				<td>날짜</td>
			</tr>
			<c:forEach var="item" items="${list}">
			  <tr class="tr_body">
			    <td>${item.bnum}</td>
			    <td>${item.field}</td>
			    <td>
			    	<a href="/qboard/boardView.bo/${item.bnum}">${item.title}</a>
			    </td>
			    <td>${item.id}</td>
			    <td>${item.views}</td>
			    <td>${item.bdate}</td>
			  </tr>
			</c:forEach>
			<tr align="right">
				<td colspan="6"><a href="/qboard/boardWriteForm.bo">글쓰기</a></td>
			</tr>
		</table>
	</section>

</body>
</html>