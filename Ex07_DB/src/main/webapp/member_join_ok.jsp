<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
</head>
<body>

	<%
		// 한글 깨짐 방지 인코딩 지정
		request.setCharacterEncoding("utf-8");
	
		// 데이터 받기
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		// 출력
		out.println(id+"<br>");
		out.println(pw+"<br>");
		out.println(name+"<br>");
		out.println(email+"<br>");
		out.println(phone+"<br>");
		
		// DB 정보
		String dbDriver="com.mysql.cj.jdbc.Driver";
		String dbUrl="jdbc:mysql://localhost:3306/mydb";
		String dbID="root";
		String dbPW="1234";
		
		// DB 연동을 위한 객체 변수 생성
		Connection DbConn=null;
		PreparedStatement pstmt=null;
		
		// DB 연동 4단계
		try{
			// DB 연동 1단계
			Class.forName(dbDriver);
			DbConn=DriverManager.getConnection(dbUrl,dbID,dbPW);
			
			// 데이터베이스 접속 성공
			out.println("DB 접속이 성공돠었습니다.");
			
			// DB 연동 2단계
			// DB 입력 준비 단계 -> prepare
			// SQL 쿼리를 작성하고 해당 쿼리를 실행하기 위한 그 전단계로  DB에 입력을 준비하는 단계
			// SQL 쿼리문 준비 및 실행을 위한 statement 또는 preparedStatement 객체 생성이 필요 --> DbConn
			pstmt=DbConn.prepareStatement("INSERT INTO tbl_member VALUES (?,?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setString(4,email);
			pstmt.setString(5,phone);
			out.println(pstmt); // 최종 완성된 쿼리문이 출력 (실행한 것은 아니고, 실행 전 준비한 ㅝ리문 화면단에 출력)
			// DB 연동 3단계
			// DB 입력을 위해 준비한 쿼리문 실행 -> execute
			pstmt.execute();
			
		}
		catch(Exception e){
			e.printStackTrace();
			out.println("DB 접속이 실패했습니다. 콘솔 창의 에러 메세지를 확인해보세요!");
		}
		finally{
			// DB 연동 4단계
			if(pstmt!=null){
				try{
					pstmt.close();
				}
				catch(SQLException ex){
					}		
				}
			if(DbConn!=null){
				try{
					DbConn.close();
				}
				catch(SQLException ex){
					}		
				}
		}
			
	%>

</body>
</html>