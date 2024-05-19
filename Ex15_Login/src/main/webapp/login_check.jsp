<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	// 일단 DB에 입력된 암호화된 문자열 값과 똑같은 값으 만들어보자!
	//String strPw="1234";
	//MessageDigest md=MessageDigest.getInstance("SHA-256");
	//md.update(strPw.getBytes()); //암호화 처리
	//String hexPw=String.format("%064x",new BigInteger(1,md.digest()));
	//out.println(hexPw+"<br>");
%>

<%
	// 클라이언트 세션 ID
	String sid=session.getId();
	out.println(sid);
	
	// 데이터베이스 회원 정보
	String db_id=null;
	String db_pw=null;
	String db_name=null;
	
	// 넘어온 값 받기
	String member_id=request.getParameter("id");
	String member_pw=request.getParameter("pw");
	out.println("암호화 처리 전 =>  "+member_pw+"<br>");
	
	String strPw=member_pw;
	MessageDigest md=MessageDigest.getInstance("SHA-256");
	md.update(strPw.getBytes()); //암호화 처리
	String hexPw=String.format("%064x",new BigInteger(1,md.digest()));
	
	member_pw=hexPw;
	out.println("암호화 처리 후 => "+member_pw+"<br>");
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// DB 정보
	String dbDriver="com.mysql.cj.jdbc.Driver";
	String dbUrl="jdbc:mysql://localhost:3306/mydb";
	String dbID="root";
	String dbPW="1234";
	
	// DB 연동에 필요한 변수들 선언
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		Class.forName(dbDriver);
		conn=DriverManager.getConnection(dbUrl,dbID,dbPW);
		
		String strSQL="select * from tbl_member where id=? and pw=?";
		
		pstmt=conn.prepareStatement(strSQL);
		pstmt.setString(1,member_id);
		pstmt.setString(2,member_pw);
		
		rs=pstmt.executeQuery();
	//	rs.next();
		
		if(rs.next()){
			out.println(rs.getString("id")+"<br>");
			out.println(rs.getString("pw")+"<br>");
			out.println(rs.getString("name")+"<br><br>");
		}
		else{
			out.println(
					"<script>"+
					"alert('입력하신 정보가 없습니다.');"+
					"history.back();"+
					"</script>"
					);
		}
		
		db_id=rs.getString("id");
		db_pw=rs.getString("pw");
		db_name=rs.getString("name");
	}
	catch(SQLException ex){
		out.println(ex);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null){
			try{
				rs.close();
			}
			catch(SQLException ex){
				
			}
		}
		if(pstmt!=null){
			try{
				pstmt.close();
			}
			catch(SQLException ex){
				
			}
		}
		if(conn!=null){
			try{
				conn.close();
			}
			catch(SQLException ex){
				
			}
		}
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	// 아이디 및 비밀번호 입력 여부 체크
	if((member_id.isEmpty())||(member_pw.isEmpty())){
		out.println(
				"<script>"+
				"alert('아이디와 비밀번호를 입력해주세요!');"+
				"history.back();"	+
				"</script>"
				);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Check</title>
</head>
<body>
	
	<%
		// 로그인 인증 및 세션 값 설정
		if((member_id.equals(db_id))&&(member_pw.equals(db_pw))){
			
			// id, pw 맞으면 세션 객체 속성(세션 변수) 셋팅
			session.setAttribute("member_id",db_id);
			session.setAttribute("member_pw",db_pw);
			session.setAttribute("member_name",db_name);
			
			// 출력
			out.println(session.getAttribute("member_id")+"("+session.getAttribute("member_name")+") 회원님 방문을 환영합니다.");
		}
		else{
			out.println("먼저 ID?PW 정보를 확인하고 로그인을 해주세요!");
		}
	%>
	
	<hr>
	<ul>
		<li>
		현재 설정된 세션 아이디 : <%=session.getAttribute("member_id") %>
		</li>
		<li>
		현재 설정된 세션 비밀번호 : <%=session.getAttribute("member_pw") %>
		</li>
	</ul>
	<hr>
	
	<button onclick="location.href='./login_form.jsp';">로그인 페이지</button>
	
</body>
</html>