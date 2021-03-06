<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bitcamp.member.model.MemberDto"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="${root}/js/jquery-2.1.0.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/bootswatch.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            <a class="navbar-brand" href="<%=request.getContextPath()%>/member/main">BitCamp</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
        <c:if test="<%=((MemberDto)session.getAttribute(\"userInfo\")).getMid().equals(\"admin\") %>">
            <ul class="nav navbar-nav">
                <li class="active">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
                	<ul class="dropdown-menu">
                        <li><a href="../member/register">회원등록</a></li>
                        <!-- <li><a href="../member/memberList">회원목록</a></li> -->
                        <li><a href="#" onclick="memberList()">회원목록</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=request.getContextPath()%>/member/logout">로그아웃 (${sessionID})</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">설정 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/member/modify">개인정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<script>
function memberList(){
	$.ajax({
		url : "<%=request.getContextPath()%>/member/memberList",
		type : "GET",
		success : function(){
			/* alert("success"); */
			location.href = "<%=request.getContextPath()%>/member/memberList"; 
		},
		error : function(){
			alert("error");
		}
	});
}
</script>

