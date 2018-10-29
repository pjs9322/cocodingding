<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="js/findMember.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>

<body>
    <article class="container">
        <div class="page-header">
            <div class="col-md-6 col-md-offset-3">
                <h3 class="text-center">계정 찾기</h3>
                <br>
                <br>
            </div>
        </div>
	    <div class="col-md-6 col-md-offset-3">
	        <form action="#" method="post">
	            <div class="form-group">
	                <div class="input-group">
	                    <span class="input-group-addon">
	                        <i class="fa fa-user"></i>
	                    </span>
	                    <input type="text" class="form-control" name="userEmail" placeholder="이메일 주소 입력" required="required">
	                </div>
	            </div>
				<div class="form-group text-center">
				    <button type="submit" class="btn btn-primary btn-lg ">아이디 찾기</button>
				    <hr>
				</div>
		    </form>
			
			<form action="#" method="post">
			    <div class="form-group">
			        <div class="input-group">
			            <span class="input-group-addon">
			                <i class="fa fa-lock"></i>
			            </span>
			            <input type="text" class="form-control" name="userId" placeholder="아이디 입력" required="required">
			        </div>
			    </div>
			    <div class="form-group">
			        <div class="input-group">
			            <span class="input-group-addon">
			                <i class="fa fa-lock"></i>
			
			            </span>
			            <input type="text" class="form-control" name="userEmail" placeholder="이메일 주소 입력" required="required">
			        </div>
			    </div>
			    <div class="form-group text-center">
			        <button type="submit" class="btn btn-primary btn-lg ">비밀번호 찾기</button>
			    </div>
			
			</form>
		</div>
		<div>
			<a href="#" class="btn btn-primary btn-lg active pull-right" role="button" aria-pressed="true">돌아가기</a>
		</div>
    </article>
</body>
</html>