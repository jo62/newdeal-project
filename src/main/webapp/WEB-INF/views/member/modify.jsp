<%@page import="com.bitcamp.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BitCamp</title>
    <link href="${root}/css/bootstrap.css" rel="stylesheet">
    <link href="${root}/css/bootswatch.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
	#maddr {width: 90%; display: inline;}
    </style>
</head>
<body>

<!-- Container ======================================================================================= -->
<div class="container">
  <div class="row">
  
<!-- ★★★ Contents -->
        <div class="col-lg-12">
            <div class="page-header2">
                <h3>회원정보</h3>
            </div>


            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">ID</th>
                        <td class="text-left">
                          <input type="text" class="form-control" placeholder="아이디" readonly id="mid" value="<%=((MemberDto)session.getAttribute("userInfo")).getMid()%>">
                        </td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">
                          <input type="text" class="form-control" placeholder="이름" id="mname" value="<%=((MemberDto)session.getAttribute("userInfo")).getMname()%>">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">주소</th>
                        <td class="text-left" colspan="3">
                          <input type="text" class="form-control" placeholder="주소" id="maddr">
                          <input type="button" class="btn btn-success btn-default" value="주소찾기"
                          onclick="goPopup()">  
                        </td>
                        </tr>
                        <tr>
                        <th class="text-center">상세주소</th>
                        <td class="text-left">
                          <input type="text" class="form-control" placeholder="상세주소" id="maddrdeta"> 
                        </td>
                        <th class="text-center">우편번호</th>
                        <td class="text-left">
                          <input type="text" class="form-control" placeholder="우편번호" id="maddrcode">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="pull-right">
                <a href="#" class="btn btn-success btn-default" id="btnsubmit">저장</a>
                <a href="./list.html" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>

<!-- Footer ========================================================================================== -->
     <footer>
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled">
                    <li class="pull-right"><a href="#top">위로 이동</a></li>                    
                    <li><a href="#">BitCamp 홈</a></li>                    
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">도움말</a></li>
                    <li><a href="#">회원탈퇴</a></li>                  
                </ul>
                <p>© BitCamp 2018.</p>
            </div>
        </div>
    </footer>
</div>
<script src="${root}/js/jquery-2.1.0.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/bootswatch.js"></script>
<script type="text/javascript">
$(function() {
	
	var addrdeta = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddrdeta()%>';
	var addrcode = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddrcode()%>';
	var addr = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddr()%>';

	if (addr != null) {
		$('#maddr').val(addr);
	}
	
	if (addrdeta != null) {
		$('#maddrdeta').val(addrdeta);
	}
	
	if (addrcode != null) {
		$('#maddrcode').val(addrcode);
	}
	
})

$('#btnsubmit').click(function() {
	
	if ($('#mname').val() == "") {
		alert('이름을 입력해주세요.');
	} else {
		var parameter = JSON.stringify(
			{"mid" : $('#mid').val(),
			"mname" : $('#mname').val(),
			"maddr" : $('#maddr').val(),
			"maddrdeta" : $('#maddrdeta').val(),
			"maddrcode" : $('#maddrcode').val()});
		$.ajax({
			url : "<%=request.getContextPath()%>/member/modifyinfo",
			dataType : "json",
			type : "put",
			data : parameter,
			contentType : 'application/json;charset=UTF-8',	
			success : function(data) {
				if (data > 0) {
					alert('수정되었습니다.');
				} else {
					alert('서버 장애로 수정이 실패했습니다.');
				}
			}
		})
	}
})

</script>
<script type="text/javascript" src="${root }/js/address.js"></script>
</body>
</html>