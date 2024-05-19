<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id=request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

</head>
<body>

	<p>부모창에서 자식창으로 전달된 ID 값은 : <%=id%></p>

	<br><br>
	<button>창 닫기</button>
	<script>
	function closeWindow(){
		// Step 1. 먼저 부모창의 참조를 획득
		const parent=window.opener;
		
		// Step 2. 부모창의 name='pw' 폼 태그에 focus() 적용
		parent.document.querySelector('[name="pw"]').focus();
		
		// Step 3. 자식 창 닫기
		self.close();
	}
	
	// 창 닫기 버튼에 onclick 이벤트 설정
	document.querySelector('button').onclick=closeWindow;
</script>
</body>
</html>