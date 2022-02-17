package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


//src.jdbc.JdbcConection
public class JdbcConection {
	// Connection : oracle server 연결 sql 전달 객체
	// jdbc:oracle:thin:@localhost:1521:xe 연결 url
	// kic: userId, 1111 : password
	
	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "kic";
		String password = "1111";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager
					.getConnection(url, userId, password);
			System.out.println("ok db");
		}catch (Exception e) {
			System.out.println("error db");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			if(con !=null) {
				con.commit();
				con.close();
			}
			if (pstmt !=null) pstmt.close();
			if (rs !=null) rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
