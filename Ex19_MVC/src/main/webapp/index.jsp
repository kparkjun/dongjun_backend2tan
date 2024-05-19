<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path=request.getContextPath();
	out.println(path); // http://loccalhost/Ex19_MVC/ => /Ex19_MVC
	
	// 리다이렉트
	response.sendRedirect(path+"/memberList.do");
%>			
