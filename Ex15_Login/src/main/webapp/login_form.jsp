<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 클라이언트 세션 ID 출력
	String sid=session.getId();
	out.println(sid);
	
	// 세션 객체 속성 저장
	String member_id=(String)session.getAttribute("member_id");
	String member_pw=(String)session.getAttribute("member_pw");
	String member_name=(String)session.getAttribute("member_name");
//	out.println(member_id);
//	out.println(member_pw);
	
	// 로그인 기본 값
	boolean login=false;
	
	// 로그인 상태
	if((member_id!=null)){
		login=true;
	}
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<style>
	ul>li{
		line-height:3rem; list-style:none;
	}
	.input1{
		height:40px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
	
</style>
</head>
<body>

	<h2>Member Login</h2>
	<form name="login_form" action="./login_check.jsp" method="post" autocomplete="off">
		<hr>
		<ul>
			<%
				if(!login){
					%>
					<li>
						<input class="input1"  type="text" name="id" placeholder="아이디 입력" maxlength=16 size=40  required />
						현재 세션 : <%=member_id %>
						</li>
						<li>
						<input class="input1"  type="password" name="pw" placeholder="비밀번호 입력" maxlength=16 size=40   />
						현재 세션 : <%=member_pw %>
						</li>
					<%
				}
					else{
						out.println("<li><b>"+member_id+"("+member_name+")</b> 회원님 로그인 하였습니다.</li>");
					
				}
			%>
			
		</ul>
		</hr>
		
		<%
			// 로그인 상태
			if(login){
				out.println(
						"<input type='submit' value='로그인' disabled> "+
						"<input type='button' value='로그아웃' onclick='location.href=\"logout.jsp\" ';> "
						
						);
			}
		// 로그아웃 상태
		else{
			out.println(
					"<input type='submit' value='로그인'> "+
					"<input type='button' value='로그아웃' disabled>"
					);
		}
		%>
		
	</form>
</body>
</html>