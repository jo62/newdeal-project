<%@page import="com.bitcamp.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/public.jsp" %>
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
    
  <script language="javascript">
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
  // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${root}/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
  // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
            , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
  // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
  $("#maddr").val(roadAddrPart1);
  $("#maddrdeta").val(addrDetail);
  $("#maddrcode").val(zipNo);
}
  </script>
</head>
<body>

<!-- Main Navigation ========================================================================================== -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">BitCamp</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
                  <ul class="dropdown-menu">
                        <li><a href="#">회원등록</a></li>
                        <li><a href="#">회원목록</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${ContextPath}/member/logout">로그아웃 (userId)</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">설정 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">개인정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>


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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
<script src="${root}/js/jquery-2.1.0.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/bootswatch.js"></script>
<script type="text/javascript">
$(function() {
	
	var addrdeta = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddrdeta()%>';
	var addrcode = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddrcode()%>';
	var addr = '<%=((MemberDto)session.getAttribute("userInfo")).getMaddr()%>';

	if (addr != 'null') {
		$('#maddr').val(addr);
	}
	
	if (addrdeta != 'null') {
		$('#maddrdeta').val(addrdeta);
	}
	
	if (addrcode != 'null') {
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
</body>
</html>