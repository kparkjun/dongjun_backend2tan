<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../common.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 페이지</title>
<style>
	ul>li{line-height:3rem;list-style:none;}
	.input1{
		width:300px;
		height:30px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
</style>

</head>
<body>
	
	<h2>Member Insert</h2>
	<form name="regForm" action="./action/member_insert_ok.jsp" method="post" autocomplete="off">
		<hr>
		<ul>
			<li>
			<input class="input1"  type="text" name="id" placeholder="아이디 입력" required onkeyup="checkIdReg(event);">
			<input type="checkbox" id="chk1" name="chkId"> ID 중복 체크
			</li>
			<li>
			<input  class="input1" type="password" name="pw" placeholder="비밀번호 입력" required>
			비밀번호는 암호화 되어져서 DB에 입력
			</li>
			<li><input  class="input1" type="text" name="name" placeholder="이름 입력" required></li>
			<li><input  class="input1" type="text" name="email" placeholder="이메일 입력" required></li>
			<li>
			<input  class="input1" type="text" name="phone" placeholder="전화번호 입력" required>
			선택
			</li>
		</ul>
		<hr>
		<input type="submit" value="회원 가입">
		<button onclick="location.href='member_control.jsp?action=list'; return false;">회원 리스트</button>
	</form>
	
	<script>
	function checkIdReg(event){
		// [1]
		/*
		const regExp=/[^0-9]/g;
		// 패턴 -> 숫자와 영문자만 허용
		// 기본적으로 / 와 / 사이에는 패턴이 들어간다.
		// 괄호 사이에서 ^(캐럿)은 부정을 의미(뭐뭐 이외..라는 의미) -> 패턴이 아닌 것을 의미
		// ^ -> 괄호 밖의 정규표현식에서는 문자열의 시작을 의미
		// g는 글로벌 플래그 -> "전체 문자열에서 패턴을 찾겠다"는 의미
		const et=event.target;
		console.log(et.value); // et만 찍으면 값이출력 X
		
		// 사용자가 입력한 값이 내가 만든 패턴에 맞는지 안맞는지 체크 -> true, false -> ~.test() 사용
		
		console.log(regExp.test(et.value)); // 패턴을 적용해서 true, false 반환
		*/
		// [2]
		/*
		// match() 함수로 숫자만 검색
		const str="나는 1999년이 끝나고 2000년이 시작되면 다시 1부터 시작하는줄 알았다.";
		const regExp2=/\d+/g; //+ 없으면 숫자 하나한씩 모두 검색
		
		const matches=str.match(regExp2);
	//	console.log(matches);
	//console.log(matches.length);
	
	for(i=0;i<matches.length;i++){
		console.log(matches[i]);
	}
	*/
	/*
	// [3]
	// 비밀번호가 숫자로 시작하는지 체크
	// 예) /^[0-9]/ -> 문자열의 시작이 숫자로 시작하는지 찾는 패턴
	const strPassword="asdfasdd123";
	const regExp=/^[0-9]/;
	
	if(regExp.test(strPassword)){
		console.log("비밀번호가 숫자로 시작합니다.");
	}
	else{
		console.log("비밀번호가 숫자로 시작하지 않습니다.");
	}
	*/
	
	// [4]
	// 숫자와 영문자만 허용하기 -> 한글 X
	const regExp=/[^0-9a-zA-Z]/g;
	const et=event.target;
	
	//console.log(regExp.test(et.value));
	// 조건 처리
	if(regExp.test(et.value)){
	//	alert("아이디 입력란에는 한글을 사용할 수 없습니다.");
		et.value=et.value.replace(regExp,'');
		// et.value로 입력 필드의 값을 가져와서 regExp 로 식별된 한글을 replace 함수로 제거
	}
	
	// replace() 테스트
	//let str2="박GilDong";
	
	// console.log(str2.replace('홍','')); // GilDong
	//console.log(str2.replace(regExp,''));
	
	
	}
	
	function popUpWindow(id,name,url){
		const chkBox=document.querySelector("#"+id);
		
		// 체크박스 체크했는지 확인
		if(chkBox.checked){
			// ID 값 추출
			const idValue=document.querySelector("input[name='id']").value;
			//alert(idValue);
			// ID 값 입력 여부 체크
			if(idValue==""){
				alert("먼저 아이디를 입력해주세요!");
				chkBox.checked=false;
				document.regForm.id.focus();
				return;
			}
			
			url=url+"?id="+idValue;
			alert(idValue+"아이디를 중복 체크합니다.");
			window.open(url,name,"width=500,height=300");
		}
	
	};
	
	document.querySelector("#chk1").addEventListener("click",function(){
		popUpWindow(
				"chk1",
				"chkId",
				"./action/popUpWindow_chkId.jsp"
				);
	});
</script>
	
</body>
</html>