<%@page import="member.site.com.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="member.site.com.MemberDAO"  />   
<%
	// 넘어온 페이지 값이 없으면 => 1
	String _page=request.getParameter("page");
	
	// 일단 처음에 접속하면 1페이지로 셋팅
	int cPage=1;
	
	// 페이지 값이 널이 아니면 해당 페이지 값을 셋팅
	if(_page!=null){
		cPage=Integer.parseInt(_page);
	}
	
	// LIMIT ?,? => 이 값을 여기에서 계산해서 전달
	int cPosition=0; // 해당 페이지에서 보여져야 하는 레코드의 시작 위치
	int limitValue=4; // 한 페이지당 보여지는 레코드의 갯수
	
	// 레코드 시작 위치 계산
	cPosition=(cPage-1)*limitValue;
	//cPosition=(cPage*limitValue)-limitValue;
	
	//out.println("LIMIT "+cPosition+","+limitValue+"");
	
	// ● 총 레코드 수 구하기
	int tCount=db.getTotalRecord();
	out.println("getTotalRecord() 메서드 호출 =>"+tCount);
	// ● 총 페이지 수 구하기
			int totalRecord=tCount;
			int totalPage=(int)Math.ceil(totalRecord/Math.floor(limitValue));
			int prev=cPage-1;
			int next=cPage+1;
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<style>
	main{
		border:0px solid red;
		width:80%;
		margin: 0 auto;
	}
	table{
		width:100%;
		border:2px solid #444;
		border-collapse:collapse; /* 샐 사이 여백을 없애줌 */
	}
	th,td{
		border:1px solid #444;
		padding:10px;
		text-align:center;
	}
	caption{
		padding:30px;
		font-size:1rem;
		font-weight:bold;
		text-transform:uppercase;
		
	}
	h2{
		/* letter-spacing:-0.04rem; */
	}
	a:link{
		text-decoration-line:none;
	}
</style>
</head>
<body>
	
	<main>
		<h2>Member List with Paging</h2>
		<hr>
		<table border=1>
			<caption>
			Current Page : <%=cPage %> / <%=totalPage %> &nbsp;
			<span style="color:deeppink; text-transform:capitalize">( Total Records : <b><%=tCount %></b> )</span>
			</caption>
			<tr>
				<th>#</th>
				<th>id</th>
				<th>password</th>
				<th>name</th>
				<th>email</th>
				<th>phone</th>
				<th>level</th>
			</tr>
			<!-- 반복문을 사용하여 dataList 출력하기 -->
			<%
				for(MemberVO m:db.listDB(cPosition,limitValue)){
			%>
				<tr>
					<td><%=m.getIdx() %></td>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberPw() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getMemberEmail() %></td>
					<td><%=m.getMemberPhone() %></td>
					<td><%=m.getMemberLevel() %></td>
				</tr>
			<%		
				}
			%>
		</table>
		<hr>
		<%
			// 이전 페이지 vs 다음 페이지 처리
			// 버튼 안내문 처리는 가급적 "다음 페이지"부터 처리하는 걸 추천(크게 상관 X)
			
			// ● 기본적으로 이전 페이지 vs 다음 페이지 처리를 위해서 몇 가지 필요한 변수들
			// - 총 레코드 수 : totalRecord
			// - 총 페이지 수 : totalPage
			// - 이전 페이지 값 : prev(cPage-1 이렇게 안하기 위해서)
			// - 다음 페이지 값 : next(cPage+1)
			// - 한 페이지에 보여지는 글 갯수 : limitValue
			
			// ● 총 페이지 수 = 총 레코드 수 / 한 페이지에 보여지는 레코드 수 (소수점 주의)
			// totalPage=totalRecord / limitValue;
			// 15 /4 하면 소수점이 나오므로 올림 처리 필요 -> 소수점이 나온다 -> 즉, 페이지가 있다.
			// 이때 함수 사용 -> 소수점 처리 -> 15 /4=3.75 --> 4로 만들어주는게 필요
			// Math 클래스내 적절한 함수 사용
			
			// ● 테스트
			// 소수점 제거 함수 -> JSP vs PHP 페이징 ceil() 올림 함수, floor() 버림 함수, round() 반올림 함수
			// ceil() : 소수점 아래의 숫자를 모두 버리고, 정수부에 플러스 1
			// floor() : 소수점 아래의 숫자를 그냥 버림
			// round() : 소수점 아래의 숫자를 버리고, 대신에 0.5 이상은 1로 올리고 0.5 미만은 그냥 버림
			/* out.println(3.75+"<br>");
			out.println("Math.ceil() =>"+Math.ceil(3.75)+"<br>"); // 4.0 -> 반환값은 double type
			out.println("String.format() => "+String.format("%.0f",Math.ceil(3.75))+"<br>");
			out.println("(int) =>"+(int)Math.ceil(3.75)+"<br>");
			out.println("ceil() => "+(int)Math.ceil(3.49)+"<br>");
			out.println("floor() => "+(int)Math.floor(3.49)+"<br>");
			out.println("round() =>"+(int)Math.round(3.49)+"<br>"); */
			
			// ● 변수 출력
			out.println("총 페이지 수 : <b>"+totalPage+"</b> Pages");
			out.println("&nbsp; /&nbsp;");
			out.println("이전 페이지("+prev+")");
			out.println("현재 페이지(<font color='red'><b>"+cPage+"</b></font>)");
			out.println("다음 페이지("+next+")");
		%>
		
		<diV style="float:right">
			<%-- <a href="<%=application.getAttribute("ROOTPATH") %>/member_control.jsp?action=list	&page=<%=cPage-1%>">◀ 이전 페이지</a> 
		
		&nbsp;&nbsp;&nbsp;  --%>
		<%
			// ● 이전 페이지 구현하기
			// 기본저으로 이전 페이지 버튼의 노출은 "첫 페이지" 값하고 비교
			// 버튼 처리 -> 이전 페이지(prev) 값이 첫 페이지 값보다 작으면 -> 링크 비활성화
			// 첫 페이지 왔을 때
			/* if(prev<1){
				out.println("<span style='color:#d0d0d0'>◀ 이전 페이지</span>");
			}
			else{
				out.println("<a href='"+application.getAttribute("ROOTPATH")+"/member_control.jsp?action=list&page="+prev+"'>◀이전 페이지</a>");
			} */
			out.println(
					(prev<1)
						? 
							"<font color='#d0d0d0'>◀◀맨처음 &nbsp;◀이전   </font>" 
						: 
							"<a href='"+application.getAttribute("ROOTPATH")+
							"/member_control.jsp?action=list&page=1'>◀◀맨처음</a> &nbsp;"+
							"<a href='"+application.getAttribute("ROOTPATH")+
							"/member_control.jsp?action=list&page="+prev+"'>◀이전</a>"
							
					);
		%>
		
		&nbsp; / &nbsp;
		
		<%-- <a href="<%=application.getAttribute("ROOTPATH") %>/member_control.jsp?action=list	&page=<%=cPage+1%>">다음 페이지 ▶</a> --%>
		<%
			// ● 다음 페이지 구현하기
			// 기본적으로 다음 페이지 버튼의 노출은 "총 페이지" 값하고 비교
			// 총 페이지가 4라면 그 4페이지가 맨 마지막 페이지라는 뜻이므로 그때 비교하여 -> 안내문 출력(버튼 비활성화)
			// 버튼 노출 -> 총 페이지(totalPage) 값보다 다음 페이지(next) 값이 커지면 -> 링크 비활성화
			// 맨 마지막 페이지에 왔을 때
			/*
			if(totalPage<next){
				out.println("<font color='#d0d0d0'>다음 페이지 ▶</font>");
			}
			else{
				out.println("<a href='"+application.getAttribute("ROOTPATH")+"/member_control.jsp?action=list&page="+next+"'>다음 페이지 ▶</a>");
			}
			*/
			out.println(
					(totalPage<next)
						? 
							"<font color='#d0d0d0'>다음 ▶ &nbsp; 마지막▶▶</font>" 
						: 
							"<a href='"+application.getAttribute("ROOTPATH")+
							"/member_control.jsp?action=list&page="+next+"'>다음  ▶</a> &nbsp; "+
							"<a href='"+application.getAttribute("ROOTPATH")+
							"/member_control.jsp?action=list&page="+totalPage+"'>마지막▶▶</a>"
					);
		%>
		</diV>
		
		
		<div style="height:100px;"></div>
	</main>
	
</body>
</html>