<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BitCamp</title>
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/bootswatch.min.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    #mid {width: 300px; display: inline;}
    </style>
</head>
<body>

	<!-- Main Navigation ========================================================================================== -->
	<div id="header">
	</div>

	<!-- Container ======================================================================================= -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<div class="page-header">
					<h2 id="container">회원 가입하기</h2>
				</div>

				<div class="well">
					<p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
					<form class="form-horizontal" action="#">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label">아이디</label>

								<div class="col-lg-10">
									<input id="mid" type="text" class="form-control" placeholder="아이디">
									<button type="button" class="btn btn-primary" id="btnId">아이디 확인</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">이름</label>

								<div class="col-lg-10">
									<input type="text" id="mname" class="form-control" placeholder="이름">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호</label>

								<div class="col-lg-10">
									<input type="password" id="mpwd" class="form-control" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호 확인</label>

								<div class="col-lg-10">
									<input type="password" class="form-control"
										placeholder="비밀번호 확인" id="mpwd2" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">기본주소</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" placeholder="주소" id="maddr">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">상세주소</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" placeholder="상세 주소" id="maddrdeta">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">우편번호</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" placeholder="우편번호" id="maddrcode">
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="button" class="btn btn-primary" id="btnSubmit">확인</button>
									<a href="./login.html" class="btn btn-large btn-default">취소</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>

		</div>

		<!-- Footer ========================================================================================== -->
		<div id="footer">
		</div>
	</div>

	<script src="./js/jquery-2.1.0.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/bootswatch.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#header").load("inc/header.jsp");
		$("#footer").load("inc/footer.jsp");
	})
	
	function idCheck() {
		$.ajax({
			url : "<%=request.getContextPath()%>/member/idCheck",
			type : "post",
			data : {"mid" : $('#btnId').val()},
			success : function(data) {
				if(data == true) {
					alert('사용 가능한 아이디입니다.');
				} else {
					alert('이미 사용 중인 아이디입니다.');
				}
			}
		});
	}
	
	$('#btnSubmit').click(function() {
		if ($('#mid').val() == "" || $('#mpwd').val() == "" || $('#mpwd2').val() == ""
				|| $('#mname').val() == "") {
			alert('필수 입력 사항이 기입되지 않았습니다.');
		}
		
		if ($('#mpwd').val() != $('#mpwd2').val()) {
			alert('비밀번호가 일치하지 않습니다.');
		}
		
		// 아이디 검사
		
	})
	
	
	
	</script> 
</body>
</html>