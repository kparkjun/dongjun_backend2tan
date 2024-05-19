package member.site.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	// Connection 변수 선언
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	// MySQL 데이터베이스 연결 정보
	String dbDriver="com.mysql.cj.jdbc.Driver";
	String dbUrl="jdbc:mysql://localhost:3306/mydb";
	String dbID="root";
	String dbPW="1234";
	// 메서드
	
	// 연결 : connect()
	public void connect() {
		try {
			Class.forName(dbDriver);
			conn=DriverManager.getConnection(dbUrl,dbID,dbPW);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 연결 해제 : disconnect()
	public void disconnect() {
		if(pstmt!=null) {
			try {
				pstmt.close();
			}
			catch(SQLException ex) {
				ex.printStackTrace();
			}
		}
			if(conn!=null) {
			try {
				conn.close();
			}
			catch(SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
	// 입력 : insertDB()
	public int insertDB(MemberVO m) {
		int res=-1;
		try {
			// DB 연동 1단계(키워드 -> Connection) : DB 연결
			connect();
			
			// DB 연동 2단계(키워드 -> Prepare) : SQL 쿼리 준비
			// SQL 쿼리를 작성하고 해당 쿼리를 실행하기 위한 그 전 단계로 DB에 입력을 준비하는 단계
			// SQL 쿼리문 준비 및 실행을 위한 statement 또는 preparedStatement 객체 생성이 필요 -> pstmt=conn.pre...(SQL)
//			String strSQL="INSERT INTO tbl_member(id,pw,name,email,phone) VALUES (?,?,?,?,?)";
			String strSQL="insert into tbl_member(id,pw,name,email,phone) values(?,?,?,?,?)";
										
									
										
//			String strSQL="delete from tbl_test1";  //5
//			String strSQL="create table tbl_test2( "+
//										"id int not null, "+
//										"name varchar(255) not null, "+
//										"age int not null, "+
//										"primary key(id))";
										
			pstmt=conn.prepareStatement(strSQL);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPw());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			
			//System.out.println(pstmt); // 최종 완성된 쿼리문 출력(실행 전 준비한 쿼리문 콘솔에 출력)
			// DB 연동 3단계(키워드 -> Execute) : SQL 쿼리 실행
			res=pstmt.executeUpdate();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		
		}finally {
			// DB 연동 4단계(키워드 -> close) : 자원 반납
			disconnect();
		}
		return res;
	}
	// 출력 : listDB()
	public ArrayList<MemberVO> listDB(){
		// ArrayList 선언
		// DB에서 한 명씩 가져온 멤버 데이터를 담는 용도로 사용
		ArrayList<MemberVO> dataList=new ArrayList<>();
		try {
			// DB 연동 1단계(키워드 -> Connection) : DB 연결
			connect();
			// DB 연동 2단계(키워드 -> Prepare) : SQL 쿼리 준비
			String strSQL="select * from tbl_member order by id desc";
			pstmt=conn.prepareStatement(strSQL);
			
					
			// DB 연동 3단계(키워드 -> Execute) : SQL 쿼리 실행 시 ResultSet 값을 반환
			rs=pstmt.executeQuery();
			
			// rs.next() 반복 : 한명의 맴버 객체 셋팅 - 다음 레코드가 있으면 true, 없으면 false
			// rs.close(0 자원 반납하는 거 꼭 기억!
			while(rs.next()){
				// 하나의 레코드에 들어있는 필드 값들을 저장하는 객체 생성
				MemberVO member=new MemberVO();
					
				member.setId(rs.getString(1));
				member.setPw(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setPhone(rs.getString(5));
				
				// 하나의 멤버 정보가 모두 셋팅되았으면 ArrayList에 추가
				//System.out.println(member);
				dataList.add(member);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// DB 연동 4단계(키워드 -> Close) : DB 연결 해제
			disconnect();
		}
				
		return dataList;
	}
	// 수정 : updateDB()
	public boolean updateDB(MemberVO m) {
		try {
			// DB 연동 1단계(Connection)
			connect();
			// DB 연동 2단계(Prepare)
			String strSQL="update tbl_member set name=?, email=?, phone=? where id=?";
			
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1,m.getName());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getId());
			
			
			// DB 연동 3단계(Execute)
			pstmt.executeUpdate();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		return true;
	}
		
	// 한 명의 회원 정보 반환 : getMember()
	public MemberVO getMember(String id) {
	MemberVO member=new MemberVO();
		
		// DB에서 전달된 ID에 해당하는 회원 정보를 추출
		try {
			// DB 연동 1단계(Connection)
			connect();
			// DB 연동 2단계(Prepare)
			String strSQL="select * from tbl_member where id=?";
			
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1, id);
			
			// DB 연동 3단계(Execute)
			rs=pstmt.executeQuery();
			rs.next();
			
//			System.out.println(rs.getString("id"));
//			System.out.println(rs.getString("pw"));
//			System.out.println(rs.getString("name"));
//			System.out.println(rs.getString("email"));
//			System.out.println(rs.getString("phone"));
			
			// 맴버 객체 셋팅
			member.setId(rs.getString("id"));
			member.setPw(rs.getString("pw"));
			member.setName(rs.getString("name"));
			member.setEmail(rs.getString("email"));
			member.setPhone(rs.getString("phone"));
			//System.out.println(member);
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		return member;
	}
	
	// 삭제 : deleteDB()
	public boolean deleteDB(String id) {
		try {
			connect();
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
			
			
				
			pstmt.executeUpdate();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 중복 ID 체크하기
	public boolean checkID(String id) {
		boolean flag=false;
		
		try {
			// DB 연동 1단계(Connection)
			connect();
			// DB 연동 2단계(Prepare)
			String strSQL="select * from tbl_member where id=?";
			
			pstmt=conn.prepareStatement(strSQL);
			pstmt.setString(1, id);
			// DB 연동 3단계(Execute)
			flag=pstmt.executeQuery().next();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		
		return flag;
	}
}
