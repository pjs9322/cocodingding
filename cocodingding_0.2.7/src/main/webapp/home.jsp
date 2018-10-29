<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" type="text/css" href="/qboard/resources/css/main.css">

    <style>
        body {
            position: relative;


        }

        #section1 {
            padding-top: 100px;
            height: 675px;
            color: #fff;
            background-color: #1E88E5;
        }

        #section2 {
            padding-top: 100px;
            height: 675px;
            color: #fff;
            background-color: #673ab7;
        }

        #section3 {
            padding-top: 100px;
            height: 675px;
            color: #fff;
            background-color: #ff9800;
        }

        #section4 {
            padding-top: 100px;
            height: 675px;
            color: #fff;
            background-color: #00bcd4;
        }


        .modal-dialog {
            width: 100%;
            margin-top: 100px;
        }

        a#cancel,
        a#cancel:hover {
            color: white;
        }

        #username_check,
        #nickname_check {
            color: white;
        }

        .modify {
            margin-top: -12px;
        }

        #sectionAll {
            text-align: center;

        }
    </style>



</head>

<body>

    <!--****** Navigation Bar ******-->
    <!--****** Navigation Bar ******-->
    <nav class="navbar fixed-top navbar-expand-sm bg-dark navbar-dark " id="top_navbar">
        <div class="container-fluid">

            <!-- 브랜드 로고 -->
            <a href="#" class="navbar-brand">코코딩딩</a>
            <!-- 햄버거 버튼  -->
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- 모바일 환경 적용 옵션 -->
            <!-- 특정 px 미만 일 시에 본 태그 안의 내용이 모바일 형태의 레이아웃으로 변경됨 -->
            <div class="collapse navbar-collapse " id="myNavbar">
                <!-- 메뉴 목록 -->
                <!-- navbar-right: 메뉴 우측 정렬, navbar-left: 메뉴 좌측 정렬 -->
                <ul class="nav navbar-nav mr-auto modify" id="top_navbar-nav">
                    <!-- 본 메뉴 클릭 시 모달창 적용 -->
                    <!-- Button HTML (to Trigger Modal) -->
                    <li class="nav-item">
                        <a class="nav-link" href="#section1">코코딩딩이란?</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section2">섹션2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section3">섹션3</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section4">풀어보기</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#login" data-toggle="modal" data-backdrop="static" data-keyboard="false">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#join" data-toggle="modal" data-backdrop="static" data-keyboard="false">회원가입</a>
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
                                <input type="text" class="form-control" name="id" placeholder="아이디 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="text" class="form-control" name="password" placeholder="비밀번호 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg">로그인</button>
                        </div>
                        <p class="hint-text">
                            아이디/패스워드를 잊어버리셨나요?
                            <br>
                            <a href="#find_id" data-toggle="modal" data-backdrop="static" data-keyboard="false">아이디 찾기</a>
                            |
                            <a href="#find_pw" data-toggle="modal" data-backdrop="static" data-keyboard="false">비밀번호 찾기</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="find_id" class="modal fade">
        <div class="modal-dialog modal-group">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <br>
                    <br>
                    <form action="#" method="post">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <input type="email" class="form-control" name="email" placeholder="이메일 주소 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-lg">아이디 찾기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="find_pw" class="modal fade">
        <div class="modal-dialog modal-group">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <br>
                    <form action="#" method="post">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <br>
                                <input type="text" class="form-control" name="id" placeholder="아이디 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-paper-plane"></i>
                                </span>
                                <input type="email" class="form-control" name="email" placeholder="이메일 주소 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-lg">비밀번호 찾기</button>
                        </div>
                        <br>
                        <br>
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
                <div class="modal-body">
                    <form action="/qboard/joinPro.me" name="f" method="post" onsubmit="return sendIt();">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <input type="text" id="my_id" class="form-control" name="id" placeholder="아이디 입력" required="required">
                                <a id="username_check" href="#" class="btn btn-primary btn-sm">
                                    아이디 중복검사
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="password" id="my_pwd" class="form-control" name="password" placeholder="패스워드 입력" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>

                                </span>
                                <input type="password" id="my_pwd1" class="form-control" name="passcheck" placeholder="패스워드 확인" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <input type="text" id="" class="form-control" name="nickname" placeholder="닉네임 입력" required="required">
                                <a id="nickname_check" href="#" class="btn btn-primary btn-sm">
                                    닉네임 중복검사
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-paper-plane"></i>
                                </span>
                                <input type="email" id="my_add" class="form-control" name="email" placeholder="이메일 주소" required="required">
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
                            <button class="btn btn-primary btn-lg" data-dismiss="modal" aria-label="Close">돌아가기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 본문 -->

    <div id="sectionAll" class="container-fluid">
        <div class="row">
            <div id="section1" class="col-md-12">
                <h1>코딩 문제풀이 사이트?</h1>
            </div>
        </div>

        <div id="section2" class="row">

        </div>
        <div id="section3" class="row">

        </div>
        <div id="section4" class="row">

        </div>
    </div>



    <script src="./js/formValidCheck.js"></script>

    <script>



        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
        });

        var reset = function () {
            $('.modal').on('hidden.bs.modal', function (e) {
                $(this).find('form')[0].reset()
            });
        };


        $(document).ready(function () {
            $('body').scrollspy({ target: ".navbar", offset: 50 });
        });

    </script>
</body>

</html>
