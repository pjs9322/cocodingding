<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>회원정보 수정 페이지입니다.</title>
	<script type="text/javascript" src="/qboard/resources/script.js"></script>
  <style>
    #container {
      width: 450px;
      margin: auto;
    }

    #align {
      width: 450px;
      margin: auto;
      padding-top: 20px;
    }


    #container h1 {
      text-align: center;
    }

    #left_side {
      width: 200px;
      display: inline-block;
      float: left;
      overflow: hidden;
      text-align: center;
    }

    #left_side label {
      font-size: 20px;
    }

    #left_side img {
      width: 160px;
      height: 168px;
    }

    #left_side #fileArea #fileBtn {
      margin-top: -15px;
      width: 100px;
      height: 29px;
      line-height: 25px;
      font-size: 10pt;
      border: 1px solid #aaa;
      background: #ccc;
      display: inline-block;
      cursor: pointer;
    }

    #left_side #fileArea input[type="file"] {
      position: relative;
      top: -30px;
      left: 0;
      width: 100px;
      height: 27px;
      opacity: 0;
    }

    #right_side {
      width: 250px;
      display: inline-block;
    }

    #right_side input[type="text"],
    #right_side input[type="password"] {
      border: 1px solid #ccc;
      padding: 3px;
      margin-bottom: 15px;
      font-size: 13pt;
    }

    #modify {
      width: 100px;
      height: 30px;
      line-height: 30px;
      background: dodgerblue;
      border: none;
      color: white;
    }

    #cancel {
      width: 100px;
      height: 30px;
      line-height: 30px;
      background: #ccc;
      border: none;
      color: white;
    }
  </style>
</head>

<body>
  <div id="container">
    <h1>회원정보 수정</h1>
    <hr />
    <div id="align">
      <form action="/qboard/modPro.me" method="post">
        <div id="left_side">
          <label for="profile">프로필사진</label>
          <img src="http://www.mbcsportsplus.com/images/img.php?srv=1&type=a&src=/2018/02/20180214095951_ifpatelf.png">
          <div id="fileArea">
             <br>
             <div id="fileBtn">파일추가</div>
             <input type="file">
          </div>
        </div>
        <div id="right_side">
			<input type="text" name="id" placeholder="아이디 입력" required="required"><br>
			<input type="password" name="password" id="password" placeholder="비밀번호 입력" required="required"><br>
			<input type="password" name="passcheck" placeholder="비밀번호확인" required="required"><br>
			<input type="text" name="nickname" placeholder="닉네임" required="required"><br>
			<input type="text" name="email" placeholder="이메일주소" required="required"><br>
        </div>
        <div>
          <input type="submit" id="modify" value="정보 수정">
          <input type="button" id="cancel" value="돌아가기" onClick="history.back()">
        </div>
      </form>
    </div>
  </div>
</body>
<html>
