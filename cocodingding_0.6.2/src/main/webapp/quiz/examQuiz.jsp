<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
   <title>Test</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!-- 부트스트랩 정의 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
   <!-- 라디오 버튼 정의 -->
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
   <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">  
  
  
 	<!-- 라디오 버튼 입력시 데이터 전송  -->
	<script type="text/javascript">
		function goData(num){
			var check = document.getElementsByName("check");
			check[num-1].checked = true;
		    document.quizform.submit();
		}
	</script>
  
	<style>
		/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */
		/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */
		/* 작은 기기들 (태블릿, 768px 이상) */
		@media (min-width: @screen-sm-min) { ... }
		/* 중간 기기들 (데스크탑, 992px 이상) */
		@media (min-width: @screen-md-min) { ... }
		/* 큰 기기들 (큰 데스크탑, 1200px 이상) */
		@media (min-width: @screen-lg-min) { ... }

		/* 네비게이션 */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
			font-size: 20px;
			background-color: black;
		}
	   
		 /* 로우 컨텐트 */
		.row.content {
			height: 100%;
		}
		
		/* 바디 */
		body {
			padding-top: 80px;
			padding-bottom: 80px;
		}
		
		/* 사이드 */
		.sidenav {
			padding-top: 20px;
			background-color: #f1f1f1;
			height: 100%;
		}
       
       /* 텍스트상자 스크롤*/
       #scroll {
          width: 100%;
          height: 450px;
          overflow: auto;
       }
       
       /* 체크박스 설정*/
       .form-check {
       	height: 40px;
       }
      
       /* 문제상자 스크롤*/
       .fixed-table {
          overflow-y: auto;
          overflow-x: auto; 
       }
      
       
       /* 작은화면 시, 높이는 'auto' 사이드바/그리드 */
       @media screen and (max-width: 767px) {
         .sidenav {
            height: auto;
            padding: 15px;
         }
         .row.content {
            height:auto;
         } 
       }
       
       /* 라디오버튼 설정 */
      label.btn span {
        font-size: 1.5em ;
      }
      
      label input[type="radio"] ~ i.fa.fa-circle-o{
          color: #c8c8c8;    display: inline;
      }
      label input[type="radio"] ~ i.fa.fa-dot-circle-o{
          display: none;
      }
      label input[type="radio"]:checked ~ i.fa.fa-circle-o{
          display: none;
      }
      label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o{
          color: #7AA3CC;    display: inline;
      }
      label:hover input[type="radio"] ~ i.fa {
      color: #7AA3CC;
      }
      
      
      div[data-toggle="buttons"] label.active{
          color: #7AA3CC;
      }
      
      div[data-toggle="buttons"] label {
         display: inline-block;
         padding: 6px 12px;
         margin-bottom: 0;
         font-size: 16px;
         font-weight: normal;
         line-height: 2em;
         text-align: left;
         white-space: nowrap;
         vertical-align: top;
         cursor: pointer;
         background-color: none;
         border: 0px solid 
         #aaaaaa;
         border-radius: 3px;
         color: #aaaaaa;
         -webkit-user-select: none;
         -moz-user-select: none;
         -ms-user-select: none;
         -o-user-select: none;
         user-select: none;
      }
      
      div[data-toggle="buttons"] label:hover {
         color: #7AA3CC;
      }
      
      div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {
         -webkit-box-shadow: none;
         box-shadow: none;
      }
       /* 문제 체크시 라디오버튼  끝 */

   </style>
   
   <!-- 온로드(시험안내문구) -->
   <script type="text/javascript">
       $(window).on('load', function () {
           $('#myModal').modal('show');
       });
   </script>
    
</head>
<body>

   <!-- 네비게이션 -->
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
         <!-- 네비 로고 -->
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <img class="" src="/qboard/resources/img/logo5.png">
         </div>
         <!-- 네비 로고 끝 -->
         
         <!-- 네비 중앙 -->
         <div class="collapse navbar-collapse" id="myNavbar">
            <!-- 네비 카테고리- -->
            <ul class="nav navbar-nav">
            </ul>
            <!-- 네비 카테고리 끝 -->
            
            <c:forEach var="article" items="${testQuiz}" varStatus="status">
            	<c:set var="size" value="${status.index}"/>
            </c:forEach>
            
            
         </div>
         <!-- 네비 중앙 끝 -->
         
      </div>
   </nav>
   <!-- 네비게이션 끝 -->
   
   <c:if test="${code eq 0 && size eq 0 && empty testQuiz.get(code).check}">
	<div class="container">    
	   <!-- 모달 -->
	   <div class="modal fade" id="myModal" role="dialog">
	      <div class="modal-dialog">
	      
	         <!-- 모달 컨텐트-->
	         <div class="modal-content">
	            <div class="modal-header">
	               <button type="button" class="close" data-dismiss="modal">&times;</button>
	               <h4 class="modal-title">테스트 전 유의사항</h4>
	            </div>
	            <div class="modal-body">
					<ol class="">
						<li><a href="">랜덤 테스트와 레벨선택 테스트는 시험시간 제한은 없습니다.</a></li>
						<c:if test="${testType ne '2'}">
							<li><a href="">문항 수는 총 10문항으로 구성되어있습니다.</a></li>
						</c:if>
						<li><a href="">'북마크' 기능을 통하여 나중에 다시 풀어 볼 수 있습니다.</a></li>
						<li><a href="">'제출하기' 버튼을 누르시면 테스트가 종료됩니다.('제출하기'를 클릭하셔야 기록이 저장됩니다.)</a></li>
						<li><a href="">테스트 종료 후 '결과 페이지'로 이동합니다.</a></li>
					</ol>
					<div class="col-lg-12">
						<h4>준비되셨습니까?</h4>  
					</div>
	               <br/>
	            </div>
	            <div class="modal-footer">
	               <button type="button" class="btn btn-primary" data-dismiss="modal">진행하기</button>
	               <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.replace('/qboard/cancel.qu');">돌아가기</button>
	            </div>
	         </div>
	         <!-- 모달 컨텐트 끝 -->
	      </div>
	   </div>
	     <!-- 모달 끝 -->
	</div>
	</c:if>
   
   <!-- 중앙 -->
   <div class="container text-center">  
      <!-- 로우 컨텐트 -->
      <div class="row content">
      
         <!-- 본문 -->
         <div class="col-lg-8 text-left"> 
         	<!--패널 -->
			<div class="panel panel-primary">
				<div class="panel-heading">
				    <h2 class="panel-title">테스트</h2>
				</div>
				<!-- 바디패널 -->
				<div class="panel-body">
         			<form
					<c:if test="${testType eq '1'}">
						action="/qboard/diagno.qu/${testQuiz.get(code).field}/${code}"
					</c:if>
					<c:if test="${testType eq '2'}">
						action="/qboard/study.qu/${testQuiz.get(code).field}/${testQuiz.get(code).levels}/${code}"
					</c:if>
					<c:if test="${testType eq '3'}">
						action="/qboard/levelUp.qu/${testQuiz.get(code).field}/${code}"
					</c:if>
					method="post" name="quizform">
					<input type="hidden" name="qnum" value="${testQuiz.get(code).qnum}">
					<input type="hidden" name="field" value="${testQuiz.get(code).field}">
					<input type="hidden" name="part" value="${testQuiz.get(code).part}">
					<input type="hidden" name="levels" value="${testQuiz.get(code).levels}">
					<input type="hidden" name="result" value="${testQuiz.get(code).result}">
					<!-- 본문 상단 -->
					<div class="">
						<div class="">
							<div class="col-md-2 col-sm-2 col-xs-2">
                                <button type="button" class="btn btn-primary btn-lg">Question ${code + 1}</button>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-5">
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-5">
                                <span id="timer" class="text-right"></span>
                            </div>
						</div>
						<div class="col-lg-12">
						</div>
						<div class="col-lg-12">
						</div>
						<div>
							<textarea class="form-control" rows="10" readOnly>${testQuiz.get(code).document}</textarea>
						</div>
					</div>
					<!-- 본문 상단 끝 -->
						
					<!-- 본문 하단 -->
					<div class="">
						<div class="row">
							<div class="col-lg-12">
								<br>
								<br>
								<div class="btn-group btn-group-vertical" data-toggle="buttons">
									<label class="btn active" onclick="goData(1);">
										<input type="radio" name="check" value="1" <c:if test="${testQuiz.get(code).check eq '1'}">checked</c:if>>
										<i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span>${testQuiz.get(code).choice1}</span>
									</label>
									<label class="btn" onclick="goData(2);">
										<input type="radio" name="check" value="2" <c:if test="${testQuiz.get(code).check eq '2'}">checked</c:if>>
										<i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span>${testQuiz.get(code).choice2}</span>
									</label>
									<label class="btn" onclick="goData(3);">
										<input type="radio" name="check" value="3" <c:if test="${testQuiz.get(code).check eq '3'}">checked</c:if>>
										<i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span>${testQuiz.get(code).choice3}</span>
									</label>
									<label class="btn" onclick="goData(4);">
										<input type="radio" name="check" value="4" <c:if test="${testQuiz.get(code).check eq '4'}">checked</c:if>>
										<i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span>${testQuiz.get(code).choice4}</span>
									</label>
								</div>
							      
							</div>
						</div>
					</div>
					<!-- 본문 하단 끝 -->
					</form>
				</div>
         		<!-- 바디패널 끝 -->
         	</div>
         	<!-- 패널 끝 -->
         </div>
         <!-- 본문 끝 -->
               
         <!-- 섹션 - 오른쪽 사이드바 -->
         <div class="col-lg-4 sidenav">
            <!-- 사이드 바 랩 . 감싸는부분-->
            <div class="">
               <!-- 사이드 상단-->
               <div class="">
                  <!-- 문제 상자 -->
                  <div id="scroll" class="col-lg-12">
					<div class="">
						<button type="button" class="btn btn-primary btn-lg">문제번호</button>
						<button type="button" class="btn btn-success btn-lg">정답</button>
						<button type="button" class="btn btn-warning btn-lg">북마크</button>
					</div>
                  
                     <c:forEach var="article" items="${testQuiz}" varStatus="status">
                     
                     <div class="col-lg-4">
                        <button class="btn btn-default" type="button"
                        	<c:if test="${testType eq '1'}">
                        		onclick="location.href = '/qboard/diagno.qu/${article.field}/${status.index}'"
							</c:if>
                        	<c:if test="${testType eq '2'}">
                        		onclick="location.href = '/qboard/study.qu/${article.field}/${article.levels}/${status.index}'"
							</c:if>
                        	<c:if test="${testType eq '3'}">
                        		onclick="location.href = '/qboard/levelUp.qu/${article.field}/${status.index}'"
							</c:if>>Question ${status.count}</button>
                     </div>
                     <div class="col-lg-3">
                         <h4>&nbsp;${article.check}&nbsp;</h4>
                     </div>
                     <div class="col-lg-4">
                        <div class="form-check">
	                        <button class="btn btn-default" type="button" onclick="location.href = '/qboard/bookMarkInsert.bm/${testType}/${article.field}/${article.levels}/${code}/${article.qnum}'">
	                        	BookMark ${status.count}
							</button>
						</div>
                     </div>
                     
                     </c:forEach>
                     
                  </div>
                  <!-- 문제상자 끝 -->
               </div>
               <!-- 사이드 상단 끝 -->
               <br/>
               <!-- 사이드 하단-->
               <div class="">
                  <div class="btn-group">
                     <button type="button" class="btn btn-info btn-lg"
                       	<c:if test="${testType eq '1'}">
                       		onclick="location.href = '/qboard/diagno.qu/${testQuiz.get(code).field}/${code - 1}'"
						</c:if>
                       	<c:if test="${testType eq '2'}">
                       		onclick="location.href = '/qboard/study.qu/${testQuiz.get(code).field}/${testQuiz.get(code).levels}/${code - 1}'"
						</c:if>
                       	<c:if test="${testType eq '3'}">
                       		onclick="location.href = '/qboard/levelUp.qu/${testQuiz.get(code).field}/${code - 1}'"
						</c:if>>이전문제</button>
                     
                     <button type="button" class="btn btn-info btn-lg"
                       	<c:if test="${testType eq '1'}">
                       		onclick="location.href = '/qboard/diagno.qu/${testQuiz.get(code).field}/${code + 1}'"
						</c:if>
                       	<c:if test="${testType eq '2'}">
                       		onclick="location.href = '/qboard/study.qu/${testQuiz.get(code).field}/${testQuiz.get(code).levels}/${code + 1}'"
						</c:if>
                       	<c:if test="${testType eq '3'}">
                       		onclick="location.href = '/qboard/levelUp.qu/${testQuiz.get(code).field}/${code + 1}'"
						</c:if>>다음문제</button>
					</div>
					<div class="col-lg-12">
					</div>
					<div class="col-lg-12">
					</div>
					<div>
						<button type="button" class="btn btn-danger btn-lg btn-block" onclick="location.href = '/qboard/complete.qu/${testType}'">문제제출</button>
					</div>
               </div>
               <!-- 사이드 하단 끝 -->
            </div>
            <!-- 사이드바 랩 끝 -->
         </div>
         <!-- 오른쪽 사이드 끝 -->
         
      </div>
      <!-- 로우 컨텐트 끝-->
   </div>
   <!-- 섹션 끝 -->
   
   <!-- 푸터 -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<p>Created by Coco Dingding</p>
		</div>
	</nav>
	<!-- 푸터 끝 -->
	
	<!-- 타이머 스크립트 -->
	<script>
        var iSecond;
        var timerchecker = null;
        window.onload = function () {
            fncClearTime();
            initTimer();
        }

        function fncClearTime() {
            iSecond = 01;
        }

        Lpad = function (str, len) {
            str = str + "";
            while (str.length < len) {
                str = "0" + str;
            }
            return str;
        }

        initTimer = function () {
            var timer = document.getElementById("timer");
            rHour = parseInt(iSecond / 3600);
            rHour = rHour % 60;
            rMinute = parseInt(iSecond / 60);
            rMinute = rMinute % 60;
            rSecond = iSecond % 60;

            if (iSecond >= 0) {
                timer.innerHTML = "&nbsp;" + Lpad(rHour, 2) + "시간 " + Lpad(rMinute, 2)
                    + "분 " + Lpad(rSecond, 2) + "초 ";
                iSecond++;
                timerchecker = setTimeout("initTimer()", 1000);
            } else {
                clearInterval(initTimer);
            }
        }

        function refreshTimer() {
            var xhr = initAjax();
            xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
            xhr.send();
            fncClearTime();
        }

        function logoutUser() {
            clearTimeout(timerchecker);
            var xhr = initAjax();
            xhr.open("POST", "/mail/user.public.do?method=logout", false);
            xhr.send();
            location.reload();
        }

        function initAjax() {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        }
    </script>
    <!-- 타이머 스크립트 끝 -->
    
    <script>
    $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
    </script>
    
</body>
</html>