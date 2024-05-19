package com.member;

import java.util.List;

import javax.naming.NamingException;

public class MemberService {

	MemberDAO memberDAO;
	
	// 생성자를 이용한 MemberDAO 객체 생성
	public MemberService() {
		memberDAO=new MemberDAO();
	}
	
	// list() => /memberList.do 요청이 들어왔을 때
	public List<MemberVO> list(int cPosition,int limitValue) throws NamingException{
		List<MemberVO> dbList=memberDAO.listDB(cPosition,limitValue);
		return dbList;
	}
	
	// insert() => /memberInsert.do 요청이 들어왔을 때
	public void insert(MemberVO m) throws NamingException {
		memberDAO.insertDB(m);
	}
	
	// delete() => /memberDelete.do 요청이 들어왔을 때
	public boolean delete(String id) throws NamingException {
		boolean flag=memberDAO.deleteDB(id);
		
		return flag;
	}
	
	// getSelectRecord() => /memberUpdateForm.do 요청이 들어왔을 때
	public MemberVO getSelectRecord(String id) throws NamingException {
		MemberVO record=memberDAO.getSelectRecordDB(id);
		
		return record;
	}
	
	// update() => /memberUpdate.do 요청이 들어왔을 때
	public void update(MemberVO m) throws NamingException {
		memberDAO.updateDB(m);
	}
	
	// tCount() => 총 레코드 수 반환하는 DAO 메서드(getTotalRecord) 호출
	public int tCount() throws NamingException {
		int totalRecord=memberDAO.getTotalRecord();
		return totalRecord;
	}
}
