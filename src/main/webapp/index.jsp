<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bitcamp.member.model.MemberDto"%>

<%
MemberDto memberDto = new MemberDto();
memberDto.setMid("jo62");
memberDto.setMname("조영규");

session.setAttribute("userInfo", memberDto);

response.sendRedirect(request.getContextPath() + "/badmin/boardmenu.bit");
%>