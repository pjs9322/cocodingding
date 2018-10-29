<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>

	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 부트스트랩 정의 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	<style>
		/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */
		/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */
		/* 작은 기기들 (태블릿, 768px 이상) */
		@media (min-width: @screen-sm-min) { ... }
		/* 중간 기기들 (데스크탑, 992px 이상) */
		@media (min-width: @screen-md-min) { ... }
		/* 큰 기기들 (큰 데스크탑, 1200px 이상) */
		@media (min-width: @screen-lg-min) { ... }
		
	    /* 네비게이션 설정 */
  		.navbar {
		    padding-top: 15px;
		    padding-bottom: 15px;
		    border: 0;
		    border-radius: 0;
		    margin-bottom: 0;
		    font-size: 12px;
		    letter-spacing: 5px;
		}
		
		.navbar-nav li a:hover {
		    color: #1abc9c !important;
		}
  		/* 네비게이션 설정 끝 */
	    
	    /* 로우 컨텐트 */
	    .row.content {
	    	height: auto;
	    	background: yellow;
	    }
	    
	    /* 사용자 이미지 */
	    .img-responsive {
			alt: sea; 
			width: 190; 
			height: 220;
	    } 
	    
	    /* 푸터 */
	    footer {
			background-color: #555;
			color: white;
			padding: 15px;
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
	</style>
	
</head>
<body>
	
	
	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		
			<!-- 네비 로고 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="#">Logo 자리</a>
			</div>
			<!-- 네비 로고 끝 -->
			<!-- 네비 중앙 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<!-- 네비 - 카테고리- -->
				<ul class="nav navbar-nav">
					<li class="">
						<a href="#">내 블로그</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">코코딩딩<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">나의 페이지</a></li>
							<li><a href="#">게시판</a></li>
						</ul>
					</li>
				</ul>
				<!-- 네비 카테고리 끝 -->
				<!-- 네비 - 우측 -->
				<ul class="nav navbar-nav navbar-right">
				  <li>
				  	<a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
				  </li>
				</ul>
				<!-- 네비 우측 끝 -->
			</div>
		</div>
	</nav>
	<!-- 네비게이션 끝 -->
	
	
	<!-- 점보트론 -->
	<div class="jumbotron bg-transparent mb-0 radius-0">
		<div class="container">
			<div class="row">
				<!-- 점보트론 본문 -->
				<div class="col-xl-6">
					<h1 class="">자바맹인의 자바문고리</h1>
					<div class="">
						<h5>blog.cocodingding.com/blindjava</h5>
					</div>
					
					<p class="">
					  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto, dignissimos provident. Alias, aliquid, cum cumque deleniti dignissimos eos exercitationem explicabo illum inventore laboriosam nihil nobis nostrum praesentium recusandae sequi, sint!
					</p>
				</div>
				<!-- 점보트론 본문 끝 -->
			</div>
		</div>
	</div>
	<!-- 점보트론 끝 -->
	
	
	<!-- 섹션 -->
	<div class="container">  
		<!-- 로우 컨텐트 -->
		<div class="row content">
		
		
			<!-- 상단 메뉴 -->
			<div class="col-lg-12 sidenav">
				<!-- 상단 왼쪽 랩. 감싸는부분 -->
				<div class="col-lg-4">		
					<!-- 사용자 -->	
					<div class="">
						<!-- 사용자 사진 -->
						<div class="">
							<img class="img-responsive" src="/qboard/resources/admin.png" > 
						</div>
						<!-- 사용자 사진 끝 -->
						<!-- 사용자 정보 -->
						<div class="">
							<h4>자바맹인(blindjava)</h4>
							<h5>맹인의 뒷걸음질</h5>
							<div class="btn group">
								<button type="button" class="btn btn-default col-lg-6">프로필</button>
								<button type="button" class="btn btn-default col-lg-6">쪽지</button>
							</div>
							<div class="btn group col-lg-12">
								<button type="button" class="btn btn-outline-success btn-block">이웃추가</button>
							</div>
						</div>
						<!-- 사용자정보 끝 -->
					</div>	
					<!-- 사용자 끝-->	
				</div>
				<!-- 상단 왼쪽 랩 끝 -->
				
				<!-- 상단 중앙 랩. 감싸는부분 -->
				<div class="col-lg-4">
					<!-- 블로그 메뉴 -->	
					<div class="">
						<!-- 메뉴 정보 -->
						<div class="">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
											<span class="glyphicon glyphicon-folder-close">
											</span>전체보기</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<ul class="list-group">
											<li class="list-group-item"><span class="glyphicon glyphicon-pencil text-primary"></span><a href="http://fb.com/moinakbarali">질문내역</a>
												<ul class="list-group">
													<li class="list-group-item"><span class="glyphicon glyphicon-pencil text-primary"></span><a href="http://fb.com/moinakbarali">나의 질문</a></li>
													<li class="list-group-item"><span class="glyphicon glyphicon-file text-info"></span><a href="http://fb.com/moinakbarali">개념정리</a></li>
													<li class="list-group-item"> <span class="glyphicon glyphicon-comment text-success"></span><a href="http://fb.com/moinakbarali">답변내역</a><span class="badge">42</span></li>
												</ul>
											</li>
											<li class="list-group-item"><span class="glyphicon glyphicon-flash text-success"></span><a href="http://fb.com/moinakbarali">중요사항</a>
												<ul class="list-group">
													<li class="list-group-item"><span class="glyphicon glyphicon-flash text-success"></span><a href="http://fb.com/moinakbarali"></a>1번</li>
													<li class="list-group-item"><span class="glyphicon glyphicon-flash text-success"></span><a href="http://fb.com/moinakbarali"></a>2번</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- 메뉴 정보 끝 -->
					</div>	
					<!-- 블로그 메뉴 끝-->
				</div>
				<!-- 상단 중앙 랩 끝 -->
				
				<!-- 상단 오른쪽 랩. 감싸는부분 -->
				<div class="col-lg-4">
					<!-- 사용자 정보 -->
					<div class="">
						<h4>최근 댓글</h4>
						<ul class='api-list'>
							<li><a href='https://developers.adp.com/api-explorer/category/external/benefits/'>Benefits</a>
								<ul>
									<li><a href='https://developers.adp.com/api-explorer/category/external/benefits/benefit-management/'>Benefit Management</a>
										<ul>
											<li><a href='https://developers.adp.com/api-explorer/resource/external-benefit-elections-v1/'>Benefit Elections v1</a>
											</li>
											<li><a href='https://developers.adp.com/api-explorer/resource/external-benefit-election-v1/'>Benefit Election v1</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<ul class='api-list'>
							<li><a href='https://developers.adp.com/api-explorer/category/external/benefits/'>Benefits</a>
								<ul>
									<li><a href='https://developers.adp.com/api-explorer/category/external/benefits/benefit-management/'>Benefit Management</a>
										<ul>
											<li><a href='https://developers.adp.com/api-explorer/resource/external-benefit-elections-v1/'>Benefit Elections v1</a>
											</li>
											<li><a href='https://developers.adp.com/api-explorer/resource/external-benefit-election-v1/'>Benefit Election v1</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- 사용자정보 끝 -->	
				</div>
				<!-- 상단 오른쪽 랩 끝 -->
			</div>
			<!-- 상단 메뉴 끝 -->
			
			
			<!-- 중앙 공지  -->
			<div class="col-lg-12 text-left"> 
				<!-- 공지 랩. 감싸는부분 -->
				<div class="">
					<!-- 공지 -->
					<div class="">
						<hr>
						<h3>공지사항</h3>
							<p> [특강 공지] 네이버 블로그 검색 노출, 로직과 다이아 랭킹에 관하여.</p>
							<p> [나무처럼 강의] 10문 10답</p>
							<p> 블로그 방문자 늘리기, 비법을 알고 싶다면?</p>
							<p> 더 강력해진 일대일 블로그 컨설팅 and 코칭</p>
							<hr>
					</div>
					<!-- 공지 끝 -->
				</div>
				<!-- 공지 랩 끝 -->
			</div>
			<!-- 중앙 공지 끝 -->
			
			
			<!-- 하단 게시글  -->
			<div class="col-lg-12 text-left"> 
				<!-- 게시글 랩. 감싸는부분 -->
				<div class="">
					<!-- 게시물 -->
					<div class="col-lg-12 blogShort">
						<h1>Title 1</h1>
						<img src="http://www.kaczmarek-photo.com/wp-content/uploads/2012/06/guinnes-150x150.jpg" alt="post img" class="pull-left img-responsive thumb margin10 img-thumbnail">
						
							<em>This snippet use <a href="http://bootsnipp.com/snippets/featured/sexy-sidebar-navigation" target="_blank">Sexy Sidebar Navigation</a></em>
						<article><p>
						    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text
						    ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only 
						    five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release
						    of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of
						    Lorem Ipsum.    
							</p></article>
						<a class="btn btn-blog pull-right marginBottom10" href="http://bootsnipp.com/user/snippets/2RoQ">READ MORE</a> 
					</div>
					<div class="col-lg-12 blogShort">
						<h1>Title 1</h1>
						<img src="http://www.kaczmarek-photo.com/wp-content/uploads/2012/06/guinnes-150x150.jpg" alt="post img" class="pull-left img-responsive thumb margin10 img-thumbnail">
						
							<em>This snippet use <a href="http://bootsnipp.com/snippets/featured/sexy-sidebar-navigation" target="_blank">Sexy Sidebar Navigation</a></em>
						<article><p>
						    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text
						    ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only 
						    five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release
						    of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of
						    Lorem Ipsum.    
							</p></article>
						<a class="btn btn-blog pull-right marginBottom10" href="http://bootsnipp.com/user/snippets/2RoQ">READ MORE</a> 
					</div>
					<div class="col-lg-12 blogShort">
						<h1>Title 1</h1>
						<img src="http://www.kaczmarek-photo.com/wp-content/uploads/2012/06/guinnes-150x150.jpg" alt="post img" class="pull-left img-responsive thumb margin10 img-thumbnail">
						
							<em>This snippet use <a href="http://bootsnipp.com/snippets/featured/sexy-sidebar-navigation" target="_blank">Sexy Sidebar Navigation</a></em>
						<article><p>
						    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text
						    ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only 
						    five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release
						    of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of
						    Lorem Ipsum.    
							</p></article>
						<a class="btn btn-blog pull-right marginBottom10" href="http://bootsnipp.com/user/snippets/2RoQ">READ MORE</a> 
					</div>
					<!-- 게시물 끝 -->
	
					<!-- 페이지 게시판 하단 -->
					<div class="">
						<!-- 하단 페이지네이션 -->
						<nav>
							<ul class="pagination">
								<li>
									<a href="#" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
									</li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
									<li>
									<a href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
						<!-- 하단 페이지네이션 끝 -->
					</div>
					<!-- 페이지 게시판 하단 끝 -->
				</div>
				<!-- 게시글 랩 끝 -->
			</div>
			<!-- 하단 게시글 끝 -->
				
					
		</div>
		<!-- 로우 컨텐트 끝-->
	</div>
	<!-- 섹션 끝 -->
	
	<!-- 푸터 -->
	<footer class="container-fluid text-center">
		<p>Created by Coco Dingding</p>
	</footer>

</body>
</html>
