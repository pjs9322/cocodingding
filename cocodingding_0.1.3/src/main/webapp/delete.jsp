<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판</title>
<style>

	#passForm{
		width:400px;
		margin:auto;
		border : 1px solid orange;
	}
	
</style>
</head>
<body>
	<section id = "passForm">
		<form name="deleteForm" action="boardDelete.bo?bnum=${bnum}" method="post">
			<table>
				<tr>
					<td>
						<label>정말 삭제하시겠습니까?</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value = "삭제"> &nbsp;&nbsp;
						<input type = "button" value = "돌아가기" onClick ="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>