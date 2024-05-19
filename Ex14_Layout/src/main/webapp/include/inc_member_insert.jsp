<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.input1{
		height:40px;	
		bakground:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
	th{
		text-align:right;
	}
</style>
<form action="#"  method="post"  autocomplete="off">
<!-- 
	● form 태그가 table 태그의 자식 요소로 올 수 없다.
	● form 태그는 독립적인 태그로, 다른 태그(tbody)의 자식 요소로 올 수 없다.
	● 따라서, 이러한 경우는 올바른 정의가 아니라고 판단하여 이클립스 툴에서 노란 경고를 표시할 수 있다.
 -->
    <table>
    	<caption>Member Insert</caption>
    	<colgroup>
    		<col width="25%">
    		<col width="75%">
    	</colgroup>
     	<tbody>
     		
    		<tr>
    			<th>ID</th>
    			<td align="left"><input class="input1" type="text" name="id" placeholder="ID 입력해주세요!" maxlength=16 size=40  required/></td>
    		</tr>
    		<tr>
    			<th>Password</th>
    			<td align="left"><input class="input1" type="password" name="pw" placeholder="Pw 입력해주세요!"  maxlength=16 size=40 required/></td>
    		</tr>
    		<tr>
    			<th>Name</th>
    			<td align="left"><input class="input1" type="text" name="name" placeholder="Name 입력해주세요!" maxlength=16 size=40  required/></td>
    		</tr>
    		<tr>
    			<th>Email</th>
    			<td align="left"><input class="input1" type="text" name="email" placeholder="Email 입력해주세요!" maxlength=40  size=60  required/></td>
    		</tr>
    		<tr>
    			<th>Phone</th>
    			<td align="left"><input class="input1" type="text" name="phone" placeholder="Phone 입력해주세요"  maxlength=16 size=40/></td>
    		</tr>
    		
    	</tbody>
    </table>
    
	<div style="padding-top:26px"></div>
    <button>회원 입력</button>
    <button onclick="location.href='<%=application.getAttribute("ROOTPATH")%>/member_control.jsp?action=list';">회원 리스트 페이지</button>
    </form>