package org.spring.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MBConn {
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			//드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			//con = DriverManager.getConnection(
			//		"jdbc:mysql://localhost/gns5780", "gns570","Sshs1515@");
			//con = DriverManager.getConnection(
				//	"jdbc:mysql:thin:@localhost/gns5780.cafe24.com", "gns5780","Sshs1515@");
			con = DriverManager.getConnection(
					"gns5780.cafe24.com", "gns5780","Sshs1515@");
			System.out.println("연결성공");
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("오라클 컨넥션 객체 실패");
			e.printStackTrace();
		}
		
		return con;
	}
}
