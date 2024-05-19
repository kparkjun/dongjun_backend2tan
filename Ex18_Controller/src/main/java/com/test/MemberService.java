package com.test;

import java.util.List;

public class MemberService {

	MemberDAO memberDAO;
	
	// MemberService() : 생성자를 이용한 MemberDAO 객체 생성
	public MemberService() {
		memberDAO=new MemberDAO();
	}
	
	// MemberDAO.add() : /memberInsert.do 요청이 들어왔을 때
	public void add(MemberVO m) {
		memberDAO.add(m);
	}
	// MemberDAO.listDB() : /memberList.do 요청이 들어왔을 때
	public List<MemberVO> list(){
		List<MemberVO> recordList=memberDAO.listDB();
		
		return recordList;
		
	}
	
	// MemberDAO.deleteDBAll() : /memberDelete.do 요청이 들어왔을 때
	public void delete() {
		memberDAO.deleteDBAll();
	}
}
