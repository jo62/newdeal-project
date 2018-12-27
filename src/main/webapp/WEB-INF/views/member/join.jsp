<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<!DOCTYPE html>
<html lang="ko">
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
    #mid {width: 300px; display: inline;}
    #zipNo {width: 300px; display: inline;}
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
          <form class="form-horizontal" action="<%=request.getContextPath()%>/member/insertMember" id="memberform" method="post">
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
                <label class="col-lg-2 control-label">우편번호</label>

                <div class="col-lg-10">
                <input type="hidden" id="confmKey" name="confmKey" value=""  >
                  <input type="text" class="form-control" placeholder="우편번호" id="zipNo" readonly>
                  <input type="button" class="btn btn-primary" value="주소검색" onclick="goPopup();">
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-lg-2 control-label">기본주소</label>

                <div class="col-lg-10">
                  <input type="text" class="form-control" placeholder="주소" id="roadAddrPart1">
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-lg-2 control-label">상세주소</label>

                <div class="col-lg-10">
                  <input type="text" class="form-control" placeholder="상세 주소" id="addrDetail">
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
  <script src="${root}/js/jquery-2.1.0.js"></script>
  <script src="${root}/js/bootstrap.min.js"></script>
  <script src="${root}/js/bootswatch.js"></script>
  
  <script language="javascript">
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
  // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${root}/badmin/jusoPopup.bit","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
  // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
            , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
  // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
  $("#roadAddrPart1").val(roadAddrPart1);
  $("#addrDetail").val(addrDetail);
  $("#zipNo").val(zipNo);
}
</script>
  
  <script type="text/javascript">
  $(function() {
    $("#header").load("inc/header.jsp");
    $("#footer").load("inc/footer.jsp");
  })
  
  function idCheck() {
      if ($('#mid').val()=="") {
        alert("id를 입력해주세요!");
      } else {
        $.ajax({
          url : "<%=request.getContextPath()%>/member/idCheck",
          type : "post",
          data : {"mid" : $('#mid').val()},
          success : function(data) {
            if(data == true) {
              alert('사용 가능한 아이디입니다.');
            } else {
              alert('이미 사용 중인 아이디입니다.');
              $('#mid').val("");
              return;
            }
          }
        });
      }
    }
  $("#btnId").click(function() {
    idCheck();
  });
  
  
  $('#btnSubmit').click(function() {
    if ($('#mid').val() == "" || $('#mpwd').val() == "" || $('#mpwd2').val() == ""
        || $('#mname').val() == "") {
      alert('필수 입력 사항이 기입되지 않았습니다.');
      return;
    }
    
    if ($('#mpwd').val() != $('#mpwd2').val()) {
      alert('비밀번호가 일치하지 않습니다.');
      return;
    }
    
    idCheck();
    
    $('#memberform').submit;
    
  })
  
  
  
  </script> 
</body>
</html>