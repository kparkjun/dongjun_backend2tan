package com.member;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ConnectionPool {

	private static DataSource _ds=null;
	
	public static Connection getConn() throws NamingException,SQLException{
		
		// DataSource 객체 생성
		if(_ds==null) {
			//InitialContext ctx=new InitialContext();
			//_ds=(DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		_ds=(DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/mysql");
		}
		
		return _ds.getConnection();
	}
	
}
