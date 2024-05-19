<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP TEST</title>
</head>
<body>
	
	<%
		// DataSource 객체 생성
		InitialContext ctx=new InitialContext();
		DataSource ds=(DataSource) ctx.lookup("java:/comp/env/jdbc/mysql");
		
		// Connection 객체 생성
		Connection conn=ds.getConnection(); // DB 연동 1단계
		
		// 쿼리뮨 생성과 실행
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select version()");
		
		if(rs.next())
			out.println("MYSQL Version : "+rs.getString("version()")); //1 해도 가능
		
		// 자원 반납
		rs.close();
		stmt.close();
		conn.close();
		ctx.close();
			
	%>
	
</body>
</html>