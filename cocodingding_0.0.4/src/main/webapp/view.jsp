<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String bnum = (String) request.getAttribute("bnum");
%>

<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 : ${article.title}
		</section>
		<section id="articleContentArea">
			${article.document}
		</section>
	</section>
	<section id="commandList">
		<a href="./boardModifyForm.bo?bnum=<%=bnum %>">[수정]</a>
		<a href="./boardRemoveForm.bo?bnum=<%=bnum %>">[삭제]</a>
		<a href="./boardList.bo">[목록]</a>
	</section>
</body>
</html>