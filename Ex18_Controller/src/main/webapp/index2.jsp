<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ● 만들어야 하는 파일1 :  java 파일들
		BoardController.java
			서블릿, 사용자 요청을 처리하는 컨트롤러
			기존에 JSP 파일로 처리 => member_control.jsp 파일이 담당
		BoardVO.java
			페이지 사이에서 데이터 전달을 목적으로 만들어진 데이터 객체
		BoardDAO.java
			데이터베이스 연동(연결/해제) 후 여러 데이터 처리를 담당하는 클래스
		BoardService.java
			Controller <=> DAO 사이에서 인터페이스 역할
			
● 만들어야 하는 파일2 : jsp 파일들(뷰페이지를 담당)
		index.jsp
			메인 페이지, 루트로 접속하자 마자 바로 특정 URL로 리다이렉트
			http://localhost/EX18_Controller/ -->
			
<%
// 	String path=request.getContextPath();
// 	out.println(path);
	
// 	// 리다이렉트
// 	response.sendRedirect(path+"/memberList.do");
%>			
<%
	// substring() 메소드 사용하기
	// 문자열을 특정 위치에서 시작하여 특정 길이 만큼 잘라서 새로운 문자열로 반환
	// substring(start index,end index) => 시작 인덱스 포함하여 종료 인덳  전까지 컷
	// end 인덱스를 지정하지 않으면 문자열의 시작부터 끝까지 컷
	// indexOf() 메서드와 함께 많이 사용
// 	String str="Hello, World!";
// 	out.println(str.substring(0)+"<br>"); // Hello, World!
// 	out.println(str.substring(0,str.length()-1)+"<br>"); //13
// 	out.println(str.substring(7)+"<br>");// World!
// 	out.println(str.substring(7,str.length()-1)+"<br>");// World
	
// 	out.println(str.substring(str.indexOf("o"))+"<br>");// o, World
// 	out.println(str.substring(str.indexOf("o")+1)+"<br>");// , World!
// 	out.println(str.substring(str.indexOf("d"))+"<br>");// d!

// 사용자 요청에서 액션 값만 분리하기 => substring() + indexOf() 조합
// [1]
		/* String str1="/home/user/index.do";
		
		out.println(str1.indexOf("/",6)+"<br>");
		out.println(str1.substring(0,str1.indexOf("/",6))+"<br>");
		
		out.println(str1.substring(str1.substring(0,str1.indexOf("/",6)).length())); // 출력 => /index.do
		*/
				
	// [2]
	//	String str2="http://localhost/Ex18/controller/memberList.do";
	// 출력 => /Ex18/controller/memberList.do	
	//	String uri=str2.substring(str2.indexOf("/Ex"));
	//	out.println(uri+"<br>");
	// 출력 => /Ex18/controller	
	//	String conPath=uri.substring(0,uri.indexOf("/",6));
	//	out.println(conPath+"<br>");
	// 출력 => /memberList.do	
	//	String action=uri.substring(conPath.length());
	//	out.println(action+"<br>");
	// [3]
		/* String str3="htp://localhost/Ex18_controller/memberList.do";
		
		String uri=str3.substring(str3.indexOf("/Ex"));
		String conPath=uri.substring(0,uri.indexOf("/",1));
		String action=uri.substring(conPath.length());
		
		out.println(uri+"<br>");					// 출력 => /Ex18_controller/memberList.do
		out.println(conPath+"<br>");		// 출력 => /Ex18_controller
		out.println(action+"<br>");			// 출력 => /memberList.do */
	// [4]
	// 서버 스타트 할 때 실행되는 줏 => http://localhost/Ex18_controller/index.jsp	
		String str4="htp://localhost/Ex18_controller/index.jsp";
		
	//	String uri=str4.substring(str4.indexOf("/Ex"));
	//	String conPath=uri.substring(0,uri.indexOf("/",1));
		
		String uri=request.getRequestURI(); // => /Ex18_controller/index.jsp
		String conPath=request.getContextPath(); ///Ex18_controller
		String action=uri.substring(conPath.length());
		
		out.println(uri+"<br>");					// 출력 => /Ex18_controller/index.jsp
		out.println(conPath+"<br>");		// 출력 => /Ex18_controller
		out.println(action+"<br>");			// 출력 => /index.jsp
%>