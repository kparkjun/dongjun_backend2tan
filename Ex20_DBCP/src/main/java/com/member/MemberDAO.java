package com.member;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

/*import javax.naming.InitialContext;
import javax.sql.DataSource;*/

public class MemberDAO {

	// Connection 변수 선언
//	DataSource ds;
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	// MySQL 데이터베이스 연결 정보
//	String dbDriver="com.mysql.cj.jdbc.Driver";
//	String dbUrl="jdbc:mysql://localhost:3306/mydb";
//	String dbId="root";
//	String dbPw="1234";
	
	// MemberDAO() 생성자를 이용한 DataSource 객체 생성
//	public MemberDAO() {
//		try {
//			// DataSource 객체 생성
//			InitialContext ctx=new InitialContext();
//			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	// 연결 ; connect()
//	public void connect() {
//		try {
//			Class.forName(dbDriver);
//			conn=DriverManager.getConnection(dbUrl,dbId,dbPw);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	// 연결 해제 : disconnect()
	public void disconnect() {
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				
			}
		}
	}
	// 출력 : listDB()
	public ArrayList<MemberVO> listDB(int cPosition,int limitValue) throws NamingException{
		// ArrayLIst 서언
		// DB에서 한 명씩 가져온 멤버 데이터를 담는 용도로 사용
		ArrayList<MemberVO> dataList=new ArrayList<>();
		
		try {
			// DB연동 1단계(Connection)
			//connect();
			// 1단계와 같이 하지 않고 DataSource로부터 Connection 객체 생성
//			conn=ds.getConnection();
			conn=ConnectionPool.getConn();
			// DB연동 2단계(Prepare)
			//String strSQL="select * from tbl_member order by id desc";
			String strSQL="select * from tbl_member order by id desc limit "+cPosition  +","+limitValue +"";
			pstmt=conn.prepareStatement(strSQL);
			// DB연동 3단계(Execute)
			rs=pstmt.executeQuery(); // 쿼리문 실행 시 ResultSet 값을 반환
			
			// rs.next() 반복 : 한 명의 멤버 객체 셋팅 => 다음 레코드가 있으면 true, 없으면 false
			// rs.close() 자원 반납하는 거 꼭 기억!
			while(rs.next()) {
				// 하나의 레코드에 들어있는 필드 값들을 저장하는 객체 생성
				MemberVO member=new MemberVO();
				
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				
				// 한 명의 멤버 객체가 모두 셋팅되었으면 ArrayList에 추가
				dataList.add(member);
			}
			rs.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			// DB연동 4단계(Close)
			disconnect();
		}
		return dataList;
	}
	//입력 : insertDB()
	public boolean insertDB(MemberVO m) throws NamingException {
		try {
			// DB 연동 1단계(Connection)
//			connect();
			conn=ConnectionPool.getConn();
			// DB 연동 2단계(Prepare)
			String strSQL="insert into tbl_member(id,pw,name,email,phone) values(?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1,m.getId());
			pstmt.setString(2,m.getPw());
			pstmt.setString(3,m.getName());
			pstmt.setString(4,m.getEmail());
			pstmt.setString(5,m.getPhone());
			//System.out.println(pstmt); // 최종 완성된 쿼리뮨
			// DB 연동 3단계(Execute)
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		
		return true;
	}
	
	// 삭제 : deleteDB()
	public boolean deleteDB(String id) throws NamingException {
		try {
			// DB 연동 1단계(Connection)
//			connect();
			conn=ConnectionPool.getConn();
			// DB 연동 2단계(Prepare)
			String strSQL=null;
			if(!id.equals("deleteAll")) {
				// 한 개 레코드만 삭제
				strSQL="delete from tbl_member where id=?";
				pstmt=conn.prepareStatement(strSQL);
				pstmt.setString(1, id);
			}
			else {
				// 전체 레코드 삭제
				strSQL="delete from tbl_member";
				pstmt=conn.prepareStatement(strSQL);
						
			}
			// DB 연동 3단계(Execute)
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		
		return true;
	}
	
	// 수정 폼 : getSelectRecordDB()
	public MemberVO getSelectRecordDB(String id) throws NamingException {
		// 객체 생성
		MemberVO record=new MemberVO();
		
		try {
			// DB 연동 1단계(Connection)
//			connect();
			conn=ConnectionPool.getConn();
			// DB 연동 2단계(Prepare)
			String strSQL="select * from tbl_member where id=?";
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1, id);
			// DB 연동 3단계(Execute)
			rs=pstmt.executeQuery();
			// 반복하면서 가져온 rs 객체의 값을 새 record 객체에 셋팅
			while(rs.next()) {
				record.setId(rs.getString("id"));
				record.setPw(rs.getString("pw"));
				record.setName(rs.getString("name"));
				record.setEmail(rs.getString("email"));
				record.setPhone(rs.getString("phone"));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		return record;
	}
	
	// 수정 : updateDB()
	public boolean updateDB(MemberVO m) throws NamingException {
		
		try {
//			connect();
			conn=ConnectionPool.getConn();
			String strSQL="update tbl_member set pw=?,name=?,email=?,phone=? where id=?";
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1,m.getPw());
			pstmt.setString(2, m.getName());
			pstmt.setString(3,m.getEmail());
			pstmt.setString(4,m.getPhone());
			pstmt.setString(5, m.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 총 레코드 수 : getTotalRecord()
	public int getTotalRecord() throws NamingException {
		// 변수 선언
		int totalRecord=0;
		
		try {
//			connect();
			conn=ConnectionPool.getConn();
			String strSQL="select count(*) from tbl_member";
			rs=conn.prepareStatement(strSQL).executeQuery();
		
			// 총 레코드 수 추출
			if(rs.next()) totalRecord=rs.getInt(1);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			disconnect();
		}
		return totalRecord;
	}
}
