<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
</head>
<body>
	<!-- 
		● DB 연동 시 사용하는 Class.forName() 메서드 정리
			1. 해당 데이터베이스 관련한 드라이버 다운로드해서 등록
			2. 그럼 이 파일을 자바의 클래스 로더(Loader)가 JVM으로 로드하는 과정이 필요
			3. 즉, lib 폴더에 위치한 드라이버를 JVM으로 로드하기 위해서 사용하는 방식 -> Class.forName("로드할 클래스 이름");
			4. forName() 메서드는 DB 연결을 위해 클래스를 로드하는 데 사용
			5. 정리
				- jar 파일을 등록한 후 우리가 만드는 자바 애플리케이션에서 Driver 클래스를 로드하기 위해서,
				- forName() 메서드를 가지고 있는 Class 클래스를 사용하여 해당 데이터베이스에 맞는 드라이버 클래스를 로드한다.
				
			● 그런데 드라이버를 로드만 했을 뿐이고, 해당 드라이버 객체를 반환받은게 아닌데 어떻게 DB 연결을 하지?
				- 일단 드라이버를 로드하면 해당 드라이버의 인스턴스가 리터된다고 생각하면 쉽다.
				- 쉽게 말해서, DriverManger.~~~() 이런 식의 메서드 호출이 가능하게 되어졌다..라고 생각하면 된다.
				- new ~~~ 해서 인스턴스를 생성하지 않아도 사용이 가능
				
				- 그 이유는 드라이버 클래스의 static {} 블록 구문내에 있다.
				- 흔히 "초기화 블록" 또는 "클래스 초기화 블록"이라고 불리우는 static {} 문법은
				- 클래스 변수의 복잡한 초기화에 사용 -> 해당 클래스가 처음 로드 되어질 때 한번만 수행 (자동 실행 블록)
				- 보통 클래스내에 static { /* 초기화 블록 */ } 형식으로 구성
				
				- 이 static 블록 내에서 DriverManager.registerDriver() 메서드를 사용하여
				- 해당 데이터베이스 드라이버의 인스턴스 객체가 생성되면서 등록!
				- 이 static {} 구문은 클래스가 로드되어질 때 싱핼되는 구문이고, 클래스가 로드될 때 Drover를
				- DriverManager를 통해서 등록했기 때문에 DriverManager.getConnection() 사용하여 바로 DB 연결을 시도
				- 이후에는 SQL 쿼리문 사용해서 DB연동 작업(입력/출력)을 수행하면 끝!
				
			● 클래스 로드 과정 3단계
				1. JRE 라이브러리 폴더에서 클래스 서치
				2. 없으면 -> classpath에 지정된 폴더에서 클래스 서치 -> 올바른 파일인지 검증한 후 파일을 로드
				3. 클래스 안에 static {} (스태틱 블록)이 있으면 순서대로 블록을 실행하여 초기화
	 -->
	 
	 	<h2>Member List</h2>
	 	<hr>
	 	<%
	 		// DB 정보
	 		String dbDriver="com.mysql.cj.jdbc.Driver";
	 		String dbUrl="jdbc:mysql://localhost:3306/mydb";
	 		String dbID="root";
	 		String dbPW="1234";
	 		
	 		// DB 연동에 필요한 변수들 선언
	 		Connection conn=null;
	 		Statement stmt=null; // statement : 성명서, 진술서; 문장
	 		ResultSet rs=null; // 쿼리 결과를 받기 위해서 필요
	 		
	 		// 하나의 레코드에 들어있는 필드 값들을 저장하는 변수
	 		String id="",
	 					 pw="",
	 					 name="",
	 					 email="",
	 					 phone="";
	 		
	 		// Total Records
	 		int counter=0;
	 					 
	 		// DB 연동 4단계
	 		try{
	 			// DB 연동 1단계 (Connection)
	 			Class.forName(dbDriver);
	 			conn=DriverManager.getConnection(dbUrl,dbID,dbPW);
	 			
	 			// DB 연동 2 + 3단계 (Prepare + Execute)
	 			stmt=conn.createStatement();
	 			rs=stmt.executeQuery("select * from tbl_member"); // 쿼리문 실행시 ResultSet 값을 반환
	 			
	 			// 브라우저 화면단에 출력
	 			//out.println(rs.next() + "<br>"); // true : 다음 레코드가 있는지 체크 -> 있으면 true, 없으면 false
	 			//out.println(rs.next() + "<br>"); // true
	 			//out.println(rs.next() + "<br>"); // true
	 			//out.println(rs.next() + "<br>"); // true
	 			//out.println(rs.next() + "<br>"); // true
	 			//out.println(rs.next() + "<br>"); // false
	 			
	 			while(rs.next()){
	 				id=rs.getString("id");
	 				pw=rs.getString("pw");
	 				name=rs.getString("name");
	 				email=rs.getString("email");
	 				phone=rs.getString("phone");
	 				%>
	 				<p><%=counter+1 %>. <%=id %>, <%=pw %>, <%=name %>, <%=email %>, <%=phone %></p>
	 				<%			
	 				counter++;
	 			}
	 		}
	 		catch(SQLException ex){
	 			out.println(ex);
	 		}
	 		catch(Exception e){
	 			e.printStackTrace();
	 		}
	 		finally{
	 			// DB 연동 4단계 ( Close)
	 			if(rs!=null){
	 				try{
	 					rs.close();
	 				}
	 				catch(SQLException ex){
	 					
	 				}
	 			}
	 				if(stmt!=null){
		 				try{
		 					stmt.close();
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
	 	%>
	 
</body>
</html>