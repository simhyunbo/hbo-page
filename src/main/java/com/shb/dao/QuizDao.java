package com.shb.dao;
import java.sql.*;
import java.util.*;

import org.springframework.stereotype.*;

import com.shb.dto.*;

import oracle.jdbc.*;
import oracle.sql.*;

@Repository
public class QuizDao {
	
	final Connection dbconn = OracleConn.getInstance().getConnect();
	public ArrayList<Quiz> getQuizList() {
		CallableStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Quiz> list = new ArrayList<Quiz>();
		
		String sql = "{call p_getQuizList(?)}";
		
		try {
			stmt = dbconn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			
			rs = (ResultSet)stmt.getObject(1);
			
			while(rs.next()) {
				Quiz b = new Quiz();				
				b.setSeqno(rs.getInt("seqno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCount(rs.getInt("cnt"));
				
				b.setWdate(rs.getString("wdate"));
				b.setId(rs.getString("id"));
				b.setCorrect(rs.getString("correct"));
				list.add(b);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		return list;
	}
	public int insertQuiz(Quiz q, UploadFile f) {
		CallableStatement stmt = null;
		String sql = "{call p_insertQuiz(?,?,?,?,?,?,?,?,?,?)}";
		int rs = 0;
		
		try {
			stmt = dbconn.prepareCall(sql);
			stmt.setString(1, q.getTitle());
			stmt.setString(2, q.getContent());
			stmt.setString(3, q.getId());
			stmt.setString(4, q.getCorrect());
			stmt.setString(5, f.getFileName());
			stmt.setString(6, f.getSaveFileName());
			stmt.setString(7, f.getFileSize());
			stmt.setString(8, f.getFileType());
			stmt.setString(9, f.getFilePath());
			
			stmt.registerOutParameter(10, OracleTypes.INTEGER);
			stmt.executeUpdate();
			
			rs = stmt.getInt(10);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	public Quiz getQuiz(int qno) {
		CallableStatement stmt = null;
		ResultSet rsBoard = null;
		ResultSet rsFile = null;	
		
		Quiz q = new Quiz();
		
		String sql = "{call p_getQuiz(?,?,?,?)}";
		
		try {
			stmt = dbconn.prepareCall(sql);
			stmt.setInt(1, qno);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			stmt.registerOutParameter(4, OracleTypes.INTEGER);
			stmt.executeQuery();
			
			rsBoard = (ResultSet)stmt.getObject(2);
			rsFile = (ResultSet)stmt.getObject(3);
			
			if(rsBoard.next()) {				 			
				q.setSeqno(rsBoard.getInt("seqno"));
				q.setTitle(rsBoard.getString("title"));
				q.setContent(rsBoard.getString("content"));
				q.setCorrect(rsBoard.getString("correct"));
				q.setCount(rsBoard.getInt("cnt"));				
				q.setWdate(rsBoard.getString("wdate"));
				q.setId(rsBoard.getString("id"));
				
				if(rsFile.next()) {
					UploadFile f = new UploadFile();
					f.setFileNo(rsFile.getString("file_no"));
					f.setFileName(rsFile.getString("filename"));
					f.setFilePath(rsFile.getString("filepath"));
					f.setFileSize(rsFile.getString("filesize"));
					f.setFileType(rsFile.getString("filetype"));
					f.setSaveFileName(rsFile.getString("savefilename"));
					
					q.setUpfile(f);
				}
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
				
		return q;
	}
	public Quiz nextquiz() {
		CallableStatement stmt = null;
		ResultSet rsBoard = null;
		
		
		Quiz q = new Quiz();
		String sql = "{call p_nextquiz(?)}";
		try {
			stmt = dbconn.prepareCall(sql);
			
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			rsBoard = (ResultSet)stmt.getObject(2);
			
			
			if(rsBoard.next()) {				 			
				q.setSeqno(rsBoard.getInt("seqno"));
				q.setTitle(rsBoard.getString("title"));
				q.setContent(rsBoard.getString("content"));
				q.setCorrect(rsBoard.getString("correct"));
				q.setCount(rsBoard.getInt("cnt"));				
				q.setWdate(rsBoard.getString("wdate"));
				q.setId(rsBoard.getString("id"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}


}
