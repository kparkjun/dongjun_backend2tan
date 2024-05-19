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
				
			}
		}
		
		if(conn!=null) {
			try {
				conn.close();
			}
			catch(SQLException ex) {
				
			}
		}
	}
	
	// 출력 : listDB()
	public ArrayList<MemberVO> listDB(){
		// ArrayList 선언
		// DB에서 한 명씩 가져온 회원을 담는 용도로 사용
		ArrayList<MemberVO> dataList=new ArrayList<>();
		
		try {
			// DB 연동 1단계(Connection)
			connect();
			// DB 연동 2단계(Prepare)
			String strSQL="select * from tbl_member2 order by idx desc limit 5";
			pstmt=conn.prepareStatement(strSQL);
			// DB 연동 3단계(Execute)
			rs=pstmt.executeQuery();
			
			// 반복하면서 회원 한 명씩 ArrayList(dataList)에 담기
			// rs.close() 자원 반납하는 거 꼭 기억!
			while(rs.next()) {
				// 하나의 레코드에 들어있는 필드 값들을 저장하는 객체 생성
				MemberVO member=new MemberVO();
				
				member.setIdx(rs.getInt(1));
				member.setMemberId(rs.getString(2));
				member.setMemberPw(rs.getString(3));
				member.setMemberName(rs.getString(4));
				member.setMemberEmail(rs.getString(5));
				member.setMemberPhone(rs.getString(6));
				member.setMemberLevel(rs.getInt(7));
				
				// ArrayList에 추가
				dataList.add(member);
			}
			rs.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			// DB 연동 4단계(Close)
			disconnect();
		}
		
		return dataList;
	}
}
