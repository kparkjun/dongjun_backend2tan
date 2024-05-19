package com.test;

import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	// ArrayList (데이터베이스 역할)
	List<MemberVO> memberList=new ArrayList<>();
	
	// 입력 : add() => /memberInset.do
	public void add(MemberVO m) {
		memberList.add(m);
	}
	// 출력 : listDB() => /memberList.do
	public List<MemberVO> listDB(){
		return memberList;
	}
	// 사이즈 : getSize()
	public int getSize() {
		return memberList.size();
	}
	
	// 전체 삭제 : deleteDBAll() => /memberDelete.do
	public void deleteDBAll() {
		memberList.clear();
	}
}
