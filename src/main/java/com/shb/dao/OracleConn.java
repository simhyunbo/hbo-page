package com.shb.dao;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;


public class OracleConn {
	
	//필드
	static private OracleConn oracleConn = new OracleConn();
	
	
	//생성자
	private OracleConn() {				
	}

	//객체주소 리턴 메서드
	public static OracleConn getInstance() {
		return oracleConn;
	}

	public Connection getConnect() {
		Properties prop = new Properties();
		
		String path = OracleConn.class.getResource("shb.properties").getPath();
		//System.out.println(path);
		Connection conn = null;
		
		try {
			path = URLDecoder.decode(path, "utf-8");
			prop.load(new FileReader(path));
			
			Class.forName(prop.getProperty("driver"));
			conn= DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("pw"));			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	
	
}
