<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bitcamp.member.model.MemberDto"%>

<%
MemberDto memberDto = new MemberDto();
memberDto.setId("jo62");
memberDto.setName("조영규");
memberDto.setEmail("jo27233@gmail.com");

session.setAttribute("userInfo", memberDto);

response.sendRedirect(request.getContextPath() + "/badmin/boardmenu.bit");
%>