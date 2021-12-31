package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {
	
	public static Connection getConnection() { //리턴타입이 컨넥션 객체 
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc:MySQLDB");
			con = ds.getConnection();
			con.setAutoCommit(false); // 트랜잭션 동작함. 파일 update,ins, del 했을때는 반드시 커밋,롤백해야 적용됨. 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
//전부 다 클래스 객체로 만들었기 때문에 변수가 없어도 호출이 가능함. 
	public static void close(Connection con) {
		
		try {
			if(con!=null)
				con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) { 
		// preparedstatement로 들어오는 거. statement만 먹히는데도 있어서 통틀어서 그냥 이렇게 적음.  
		
		try{
			if(stmt!=null)
				stmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		
		try {
			if(rs!=null)
				rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		
		try {
			con.commit();
			System.out.println("commit success"); //중간에 찍어보는거 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		
		try {
			con.rollback();
			System.out.println("rollback success");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
