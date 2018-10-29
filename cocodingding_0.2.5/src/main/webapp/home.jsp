<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>

<body>

    <!-- 네비게이션. 내비바도 특정 길이에서 붕괴되는데 햄버거버튼으로 만들어주기-->
    <!--여기서 설정해주는 사이즈(navbar-expand-md)에 맞게 내비바 붕괴됨-->
    <nav class="navbar fixed-top navbar-expand-sm bg-primary navbar-dark">
        <!--상단에 고정시키려면 fixed-top 옵션 주기-->
        <div class="container">
            <a href="#" class="navbar-brand">
                <!-- 브랜드는 로고의 브랜드-->
                <img src="img/play_data_white.png"> alt="playdata">
            </a>
            <!--반응형 웹 줄였을 때 내비바를 햄버거버튼에서 펼치는 기능 toggle-->
            <button class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
                <!-- #myNavBar의 요소들을 타겟으로 토글(햄버거버튼)로 만들겠다.-->
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- 메뉴모음-->
            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                <!--justify-content-에 left center right end 다 넣어보자-->
                <!-- collapse는 아직 잘 모르겠음-->
                <ul class="nav navbar-nav">
                    <!-- navbar-nav 붙이지 않으면 부트스트랩4에서 ui가 깨지게된다.-->
                    <li class="nav-item">
                        <a class="nav-link" href="#login" data-toggle="modal">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#join" data-toggle="modal">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <br>
    <br>

    <!--****** Navigation Bar ******-->
    <!--****** Navigation Bar ******-->
    <nav class="navbar fixed-top  navbar-expand-sm bg-dark navbar-dark " id="top_navbar">
        <div class="container">

            <!-- 브랜드 로고 -->
            <a href="#" class="navbar-brand">
                <img src="#" alt="코코딩딩">
            </a>
            <!-- 햄버거 버튼  -->
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- </div> -->

            <!-- 모바일 환경 적용 옵션 -->
            <!-- 특정 px 미만 일 시에 본 태그 안의 내용이 모바일 형태의 레이아웃으로 변경됨 -->
            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                <!-- 메뉴 목록 -->
                <!-- navbar-right: 메뉴 우측 정렬, navbar-left: 메뉴 좌측 정렬 -->
                <ul class="nav navbar-nav" id="top_navbar-nav">
                    <!-- 본 메뉴 클릭 시 모달창 적용 -->
                    <!-- Button HTML (to Trigger Modal) -->
                    <li class="nav-item">
                        <a class="nav-link" href="#login" data-toggle="modal">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#join" data-toggle="modal">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Modal HTML -->
    <div id="login" class="modal fade">
        <div class="modal-dialog modal-group">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">로그인</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                	<form action="/qboard/loginPro.me" method="post">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <input type="text" class="form-control" name="id" placeholder="아이디" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg">로그인</button>
                        </div>
                        <p class="hint-text">아이디/패스워드를 잊어버리셨나요?<br><a href="/qboard/findForm.me">계정찾기</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="join" class="modal fade">
        <div class="modal-dialog modal-group">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">회원가입</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form action="/qboard/joinPro.me" method="post">
	                <div class="modal-body">
	                        <div class="form-group">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-user"></i>
	                                </span>
	                                <input type="text" class="form-control" name="id" placeholder="아이디 입력" required="required">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-user"></i>
	                                </span>
	                                <input type="text" class="form-control" name="nickname" placeholder="닉네임" required="required">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-paper-plane"></i>
	                                </span>
	                                <input type="email" class="form-control" name="email" placeholder="이메일 주소" required="required">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-lock"></i>
	                                </span>
	                                <input type="password" class="form-control" name="password" placeholder="패스워드 입력" required="required">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-lock"></i>
	
	                                </span>
	                                <input type="password" class="form-control" name="passcheck" placeholder="패스워드 확인" required="required">
	                            </div>
	                        </div>
	                </div>
	                <div class="form-group text-center">
	                    <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
	                </div>
                </form>
            </div>

        </div>
    </div>
</body>
</html>