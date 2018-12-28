<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BitCamp</title>
    <link href="${root}/css/bootstrap.css" rel="stylesheet">
    <link href="${root}/css/bootswatch.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 100px;
            padding-bottom: 40px;
            background-color: #ecf0f1;
        }
        .login-header {
            max-width: 400px;
            padding: 15px 29px 25px;
            margin: 0 auto;
            background-color: #2c3e50;
            color: white;
            text-align: center;
            -webkit-border-radius: 15px 15px 0px 0px;
            -moz-border-radius: 15px 15px 0px 0px;
            border-radius: 15px 15px 0px 0px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .login-footer {
            max-width: 400px;
            margin: 0 auto 20px;
            padding-left: 10px;
        }
        .form-signin {
            max-width: 400px;
            padding: 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            -webkit-border-radius: 0px 0px 15px 15px;
            -moz-border-radius: 0px 0px 15px 15px;
            border-radius: 0px 0px 15px 15px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 15px;
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }
        .form-btn {
            text-align: center;
            padding-top: 20px;
        }

    </style>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <!-- header -->
    <div class="login-header">
        <h2 class="form-signin-heading">BitCamp</h2>
    </div>

    <!-- form -->
    <form class="form-signin" action="${root}/member/login" method="post">
        <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디">
        <input type="password" class="form-control" id="mpwd" name="mpwd" placeholder="비밀번호">
        <div class="row form-btn">
            <button class="btn btn-large btn-warning" type="button" id="loginBtn">로그인</button>
            <a href="<%=request.getContextPath()%>/member/join" class="btn btn-large btn-default">회원가입</a>
</div>
    </form>

    <!-- footer -->
    <div class="login-footer">
        <p>© BitCamp 2018.</p>
    </div>
</div>

<script src="${root}/js/jquery-2.1.0.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/bootswatch.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function() {
	if($('#mid').val()=="" || $('#mpwd').val()=="") {
		alert("필수 입력 사항이 입력되지 않았습니다.")
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/member/userCheck",
		type : "post",
		data : {"mid" : $('#mid').val(),
			"mpwd" : $('#mpwd').val()},
		success : function(data) {
			console.log(data);
			if(data == true) {
				$('.form-signin').submit();
			} else {
				alert('아이디가 없거나, 비밀번호가 일치하지 않습니다.');
				$('#mid').val("");
				$('#mpwd').val("")
			}
		}
	});
	
})
</script>
</body>
</html>