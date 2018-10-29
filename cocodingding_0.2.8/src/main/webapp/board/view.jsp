<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<section id="commentsArea">
			<form action="/qboard/replyInsert.bo/${bnum}" method="post" name="replyform">
				<table>
					<c:forEach var="item" items="${replylist}">
						<tr>
							<td>${item.id}</td>
							<td>${item.document}</td>
							<td>${item.bdate}</td>
							<td><a href="/qboard/replyDelete.bo/${bnum}/${item.rnum}">[삭제]</a></td>
						</tr>
					</c:forEach>
					<tr>
					  <td><input type="text" name="id" value="${userInfo.nickname}" required="required" readonly></td>
					  <td colspan="2">
					  	<textarea name="document" cols="30" rows="1"  required="required"></textarea>
					  </td>
					  <td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
		</section>
	</section>
	<section id="commandList">
		<a href="/qboard/boardModifyForm.bo/${bnum}">[수정]</a>
		<a href="/qboard/boardRemoveForm.bo/${bnum}">[삭제]</a>
		<a href="/qboard/boardList.bo">[목록]</a>
	</section>
</body>
</html>