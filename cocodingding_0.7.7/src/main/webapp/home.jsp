<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
	<title>코코딩딩에 오신 것 을 환영합니다.</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- lightbox -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.min.js"></script>
	<script>
		$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			event.preventDefault();
			$(this).ekkoLightbox();
		});
	</script>
	<!-- lightbox -->

	<style>
	 
		/* Remove the navbar's default margin-bottom and rounded borders */ 
		.navbar {
		  margin-bottom: 0;
		  border-radius: 0;
		  font-size: 20px;
		  background-color: white;
		}
		
		/* Add a gray background color and some padding to the footer */
		footer {
		  background-color: #f2f2f2;
		  padding: 25px;
		}
		   
		.carousel-inner img {
		    width: 100%; /* Set width to 100% */
		    margin: auto;
		    min-height:200px;
		}
		
		/* Hide the carousel text when the screen is less than 600 pixels wide */
		@media (max-width: 600px) {
		  .carousel-caption {
		    display: none; 
		  }
		}
		
		/* 어워드 사진 */
		.img-rounded {
			height: 80px;
			width: 80px;
		}
		
		/* 중간설명 로고 사진 */
		.img-responsive {
			height: 100%;
			width: 100%;
		}
		
		/* 컨테이너 플루이드 배경 */
		#fluid {
			background-color: black;
		}
		
		#service-title {
			color: #ffffff;
		}
		
		/* 서비스 기능 아이콘 */
		#service {
			height: 150px;
			width: 150px;
		}
		
	    /* 서비스 기능 미리보기 */
		.card-img-top {
			height: 156px;
			width: 293px;
		}
		
	</style>
</head>


<body>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 햄버거버튼 -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">                     
				</button>
				<img class="" src="/qboard/resources/img/logo5.png">
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="nav-link" href="#login" data-toggle="modal" data-backdrop="static" data-keyboard="false"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><a class="nav-link" href="#join" data-toggle="modal" data-backdrop="static" data-keyboard="false"><span class="glyphicon glyphicon-edit"></span> Join</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 네비게이션  -->
	
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
                                    <i class="fa fa-paper-plane"></i>
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
   	<!-- Modal HTML -->
   	
	
	<!-- 캐러셀 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	      <li data-target="#myCarousel" data-slide-to="3"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active">
	        <img class="" src="/qboard/resources/img/back1.jpg">
	        <div class="carousel-caption">
	          <h3>1</h3>
	          <p>Money Money.</p>
	        </div>      
	      </div>
	
	      <div class="item">
	        <img class="" src="/qboard/resources/img/back2.jpg">
	        <div class="carousel-caption">
	          <h3>2</h3>
	          <p>Lorem ipsum...</p>
	        </div>      
	      </div>
	      
	      <div class="item">
	        <img class="" src="/qboard/resources/img/back3.jpg">
	        <div class="carousel-caption">
	          <h3>3</h3>
	          <p>Money Money.</p>
	        </div>      
	      </div>
	      
	      <div class="item">
	        <img class="" src="/qboard/resources/img/back4.jpg">
	        <div class="carousel-caption">
	          <h3>4</h3>
	          <p>Money Money.</p>
	        </div>      
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>
	<!-- 캐러셀 -->
	
	<!-- 컨테이너 기본 -->
	<div class="container">
		<!-- 코코딩딩 간단 -->
		<div class="row text-center">
			<br><br><br>
			<h2>Coco Dingding</h2>
			<br>
			<h4>코코딩딩은 프로그래밍 실력진단 사이트 입니다.</h4>
			<br><br>	
			<h4>사용자의 프로그래밍 실력을 객관식 문제를 통하여 확인 해보실 수 있습니다.</h4>
			<h4>Java, Web, Database 세가지 분야에서 자신의 실력을 확인해보세요! </h4>
			<br><br><br>
		</div>
		<hr>
		<!-- 코코딩딩 간단 -->
		
		<!-- 코코딩딩 배경 -->
		<div class="row">
			<br><br><br>
			<h2 class="text-center">제작배경 및 목표</h2>
			<br><br><br>
			<div class="col-xs-6">
				<br><br>
				<img class="img-responsive" alt="Image" src="/qboard/resources/img/logo3.png">
			</div>
			<div class="col-xs-6">
				<h4> 프로그래밍에서 초심자에게 필요한 내용은 어떤 것들이 있고, 그것들을 어떻게 제공할지 논의한 끝에 웹에서 프로그래밍을 공부할 수 있는 ‘프로그래밍 학습 서비스’를 구상하게 되었습니다.</h4>
				<h4> 우리는 학습자의 프로그래밍 지식함양을 목표로 하며 양질의 서비스를 제공하고자 팀원 개개인의 프로그래밍 능력 증진을 목표로 하고있습니다.</h4>
				<h4> 프로젝트와 사용자, 팀원 간의 선순환 관계를 형성하고자 하였습니다.</h4>
				<br>
			</div>
			<hr>
			<div class="col-xs-12">
				<br>
				<div class="col-xs-3">
					<img class="img-rounded" src="/qboard/resources/img/award1.png" alt="Cinque Terre">
					<p>2018 한국 코딩 만족도</p>
					<h4>1위 예상</h4>
				</div>
				<div class="col-xs-3">
					<img class="img-rounded" src="/qboard/resources/img/award4.png" alt="Cinque Terre">
					<p>과학정보통신부 장관상</p>
					<h4>대상 목표</h4>
				</div>
				<div class="col-xs-3">
					<img class="img-rounded" src="/qboard/resources/img/award2.png" alt="Cinque Terre">
					<p>2018 스마트 어워드</p>
					<h4>웹 분야 최우수 제발</h4>
				</div>
				<div class="col-xs-3">
					<img class="img-rounded" src="/qboard/resources/img/award3.png" alt="Cinque Terre">
					<p>2018 데모데이</p>
					<h4>최우수 발표팀 일까</h4>
				</div>
			</div>
		</div>
		<br><br><br>
		<!-- 코코딩딩 배경 -->
	</div>
	<!-- 컨테이너 기본-->
	
	<!-- 컨테이너 플루이드 -->
	<div class="container-fluid" id="fluid">
		
		<div class="row">
			<br><br><br>
			<h2 id="service-title" class="text-center">제공 서비스</h2>
			<br><br><br>
			<div class="col-xs-12">
				<div class="col-xs-3">
					<div class="well well-lg col-xs-12 ">
						<img id="service" class="center-block" src="/qboard/resources/img/test.png">
						<div class="text-center col-xs-12">
							<h3>4가지 종류의 테스트 제공</h3>
							<p>1. 특정 레벨에서 출제되는 수동문제 기능</p>
							<p>2. 나의 레벨과 유사한 수준의 자동문제 기능</p>
							<p>3. 실력향상을 위한 레벨 업 테스트</p>
						</div>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="well well-lg col-xs-12">
						<img id="service" class="center-block" src="/qboard/resources/img/eval.png">
						<div class="text-center col-xs-12">
							<h3>사용자의 학습상태 진단</h3>
							<p>1. 각 분야별 학습상태를 그래프로 가시화</p>
							<p>2. 해당분야의 정답률과 사용자 평균값 </p>
							<p>3. 레벨 업 테스트 후 실력진단결과 안내</p>
						</div>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="well well-lg col-xs-12">
						<img id="service" class="center-block" src="/qboard/resources/img/bookmark.png">
						<div class="text-center col-xs-12">
							<h3>틀린문제/북마크문제 리스트 기능</h3>
							<p>1. 틀린문제는 자동으로 리스트화</p>
							<p>2. 다시 풀고싶은 문제는 북마크 기능사용</p>
							<p>3. 700여개의 문제제공</p>
						</div>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="well well-lg col-xs-12">
						<img id="service" class="center-block" src="/qboard/resources/img/board.png">
						<div class="text-center col-xs-12">
							<h3>게시판 커뮤니티</h3>
							<p>1. 틀린문제/북마크문제를 게시물로 게시</p>
							<p>2. 게시물을 통한 피드백 공유</p>
							<p>3. 효과적인 실력향상</p>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<br><br><br>
	</div>
	<!-- 컨테이너 플루이드 -->
	
	<!-- 컨테이너 기본 -->
	<div class="container">
		<!-- 서비스 기능 미리보기 -->
		<h2 class="text-center">서비스 기능 미리보기</h2>
		<br><br>
		<div class="row">
			<div class="col-xs-4">
				<div class="card text-center">
					<a href="/qboard/resources/img/mainpage1.jpg" data-toggle="lightbox" data-gallery="example-gallery">
						<img class="card-img-top" src="/qboard/resources/img/mainpage1.jpg" alt="Card image">
					</a>
					<div class="card-body">
						<h4 class="card-title">문제풀이</h4>
						<p class="card-text">
							4지선다 객관식 문제를 풀 수 있습니다.
						</p>
						<p>사진을 클릭해보세요.</p>
					</div>
				</div>
			</div>
			<div class="col-xs-4"> 
				<div class="card text-center">
					<a href="/qboard/resources/img/mainpage2.jpg" data-toggle="lightbox" data-gallery="example-gallery">
						<img class="card-img-top" src="/qboard/resources/img/mainpage2.jpg" alt="Card image">
					</a>
					<div class="card-body">
						<h4 class="card-title">학습상태</h4>
						<p class="card-text">
							현재 학습상태를 보여줍니다.
						</p>
						<p>사진을 클릭해보세요.</p>
					</div>
				</div> 
			</div>
			<div class="col-xs-4">
				<div class="card text-center">
					<a href="/qboard/resources/img/mainpage3.jpg" data-toggle="lightbox" data-gallery="example-gallery">
						<img class="card-img-top" src="/qboard/resources/img/mainpage3.jpg" alt="Card image">
					</a>
					<div class="card-body">
						<h4 class="card-title">진단결과</h4>
						<p class="card-text">
							학습자의 실력을 진단합니다.
						</p>
						<p>사진을 클릭해보세요.</p>
					</div>
				</div>
			</div>
		</div>
		<br><br><br>
		<!-- 서비스 기능 미리보기 -->
	</div><br>
	<!-- 컨테이너 기본 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center">
		<br><br><br>
		<p><b>© 2018 Coco Dingding. All Right Reserved.</b></p>
		<br><br><br>
	</footer>
	<!-- 푸터 -->
	
</body>

</html>
