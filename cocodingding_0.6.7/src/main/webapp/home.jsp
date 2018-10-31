<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script src="/qboard/resources/js/music.js"></script>

    <!-- text effect javascript cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/0.11.9/jquery.velocity.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" href="/qboard/resources/css/main.css">

    <!-- text effect font style -->
    <link href='https://fonts.googleapis.com/css?family=Arvo:700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway:300,100' rel='stylesheet' type='text/css'>

    <style>
        html {
            width: 100%;
        }

        body {
            position: relative;
            
        }

        #section1 {
            margin-top: 1%;
            padding-top: 90px;
            height: 1000px;
            color: white;
            /* background-image: url("/qboard/resources/img/section1.png"); */
            background-size: 100% 100%;
            background-repeat: repeat;
            background-color: black;
            /* background-image: url("./images/section1.gif");
            background-size: 100%; */
        }
        

        #section2 {
            padding-top: 0px;
            height: 1000px;
            color: white;
            padding-top: 200px;
            /* background-image: url("/qboard/resources/img/section2.png"); */
            background-color: black;
            background-size: 100% 100%;
        }

        #section3 {
            padding-top: 300px;
            height: 1000px;
            color: white;
            /* background-image: url("/qboard/resources/img/section3.jpg"); */
            background-color: black;
            background-size: 100% 100%;
        }

        #section4 {
            padding-top: 100px;
            height: 1000px;
            color: black;
            /* background-image: url("/qboard/resources/img/section4.jpg"); */
            background-color: black;
            background-size: 100% 100%;
        }


        .card-text{
            font-size:20px;
        }

        #section4>p{
            color:white;
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

        /* 네비바 가운데 정렬 */

        .modify {
            margin-top: -12px;
        }

        #sectionAll {
            text-align: center;

        }

        .content {
            height: 25%;
        }



        @media screen and (min-width:650px) and (max-width: 1180px) {
            span,
            #section2>h1,
            #section3>h1,
            #section4>h1 {
                font-weight: bold;
                font-size: 30px;
            }
        }

        @media screen and (max-width: 649px) {
            span {
                font-size: 15px;
            }
        }

        #section3>h1 {
            margin-top: 100px;
        }



        /* text effect css */


        .orbs {
            font-family: 'Raleway', sans-serif;
            font-weight: 100;
            display: block;
            font-size: 70px;
            margin-top: 100px;
            height:100%;
        }
        
       /* 섹션 폰트사이즈 */
        p {
            font-size: 50px;
        }
        
        
        /* 섹션4 카드UI 폰트 설정 */ 
        .card-title{
            font-weight: bold;
        }

        .card-img-top{
            height:327px;
        }

        .col-md-4{
            margin-top:100px;
        }
        
    </style>

    
</head>

<body>

    <!--****** Navigation Bar ******-->
    <!--****** Navigation Bar ******-->
    <nav class="navbar fixed-top navbar-expand-sm bg-dark navbar-dark " id="top_navbar">
        <div class="container-fluid">

            <!-- 브랜드 로고 -->
            <a href="#" class="navbar-brand" onClick="window.location.reload()">코코딩딩</a>
            <!-- 햄버거 버튼  toggle-->
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
                        <a class="nav-link" href="#section1">ABOUT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section2">제공#1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section3">제공#2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section4">미리보기</a>
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
                                <input type="password" class="form-control" name="password" placeholder="비밀번호 입력" required="required">
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
                                <input type="text" id="my_nick" class="form-control" name="nickname" placeholder="닉네임 입력" required="required">
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
                <span class="orbs">
                    <span>프</span>
                    <span>로</span>
                    <span>그</span>
                    <span>래</span>
                    <span>밍</span>
                    <span>&nbsp;</span>
                    <span>공</span>
                    <span>부</span>
                    <br>
                    <br>
                    <span>문</span>
                    <span>제</span>
                    <span>풀</span>
                    <span>면</span>
                    <span>서</span>
                    <span>&nbsp;</span>
                    <span>하</span>
                    <span>자!</span>
                </span>
            </div>
            <div id="section2" class="col-md-12">
                <p>제공#1</p>
                <p>1. 자바, 웹, 데이터베이스 분야 객관식 문제</p>
                <p>2. 실력진단 모의고사(가입 후 1회)</p>
                <p>3. 레벨 시스템(레벨1~10)</p>
                <p>4. 레벨업 모의고사</p>
            </div>
            <div id="section3" class="col-md-12">
                <p>제공#2</p>
                <p>1. 학습분석 리포트</p>
                <p>2. 틀린문제는 자동저장 가능</p>
                <p>3. 선택한 문제 북마크 가능</p>
            </div>

            <!-- 섹션4는 부트스트랩 카드UI 적용-->
            <div id="section4" class="col-md-12">
                <p>사이트 미리보기</p>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card text-center">
                            <img class="card-img-top" src="/qboard/resources/img/mainpage1.jpg" alt="Card image">
                            <div class="card-body">
                                <h4 class="card-title">문제풀이</h4>
                                <p class="card-text">
                                    4지선다 객관식 문제를 풀 수 있습니다.
                                </p>
                                    <a href="/qboard/resources/img/mainpage1.jpg" target = "_blank" class="btn btn-primary">이미지 크게 보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                            <div class="card text-center">
                                <img class="card-img-top" src="/qboard/resources/img/mainpage2.jpg" alt="Card image">
                                <div class="card-body">
                                    <h4 class="card-title">학습 상태</h4>
                                    <p class="card-text">현재 학습 상태를 보여줍니다.</p>
                                        <a href="/qboard/resources/img/mainpage2.jpg" target = "_blank" class="btn btn-primary">이미지 크게 보기</a>
                                </div>
                            </div>
                        </div>
                    <div class="col-md-4">
                        <div class="card text-center">
                            <img class="card-img-top" src="/qboard/resources/img/mainpage3.jpg" alt="Card image">
                            <div class="card-body">
                                <h4 class="card-title">진단 결과</h4>
                                <p class="card-text">분석리포트를 보여줍니다.</p>
                                    <a href="/qboard/resources/img/mainpage3.jpg" target = "_blank" class="btn btn-primary">이미지 크게 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <img src="./img/mainpage1.jpg" style="margin-top: 80px;"> -->
            </div>
        </div>
    </div>

    <script src="/qboard/resources/js/formValidCheck.js"></script>

    <script>
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
        });
    </script>

    <!-- Scrollspy -->
    <script>
        $(document).ready(function () {
            $('body').scrollspy({ target: ".navbar", offset: 50 });
        });
    </script>

    <!-- smooth scroll -->
    <script src="/qboard/resources/js/smooth-scroll.js"></script>
    <script> var scroll = new SmoothScroll('a[href*="#"]');</script>


    <!-- text effect javascript code-->
    <script>
        var $orbs = $('.orbs span');
        $('.end-right').css('left', '-10%');
        $('.end-left').css('left', '110%');
        $orbs.velocity({ 'top': '-300px', scaleX: '.2', scaleY: '.2', color: '#990000' }, 0);
        var orb = 0;
        var numOrbs = $orbs.length;

        $('.end-right').velocity({ left: '50%' }, 'easeOutExpo', 1200);
        $('.end-left').velocity({ left: '50%' }, 'easeOutExpo', 1200);


        dropOrbs = function () {
            $orbs.eq(orb).velocity({ top: '70px' }, 400).velocity({ scaleX: 1, scaleY: 1, color: '#fff' }, 1000).css('position', 'relative');
            orb = orb + 1;
            if (orb < numOrbs) {
                setTimeout(dropOrbs, 100);
            }
            else {
                setTimeout(function () { $('.glow').velocity({ opacity: 1 }, 1200); }, 1200);

            }

        }

        setTimeout(dropOrbs, 400);
    </script>

</body>

</html>