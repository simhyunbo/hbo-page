package com.shb.dao;

import java.sql.*;

import org.springframework.stereotype.*;

import com.shb.dto.*;

@Repository
public class CodeDao {

	final Connection dbconn = OracleConn.getInstance().getConnect();
	
	public Code[] getCodeList(String category)  {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Code[] code = null;
		
		String sql= "SELECT count(*) as cnt FROM code ";
		sql += " WHERE category = ?";
		
		try {
			stmt = dbconn.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();		
			rs.next();
			
			code = new Code[rs.getInt("cnt")];
			sql= "SELECT code_val, code_name FROM code ";
			sql += " WHERE category = ?";			
			stmt = dbconn.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			
			int i=0;
			while(rs.next()) {
				Code c = new Code();
				c.setCodeVal(rs.getString("code_val"));
				c.setCodeName(rs.getString("code_name"));				
				code[i++] = c;
			}
		} catch (SQLException e1) {			
			e1.printStackTrace();
		}		
		
		return code;
	}
	
	
	
}
