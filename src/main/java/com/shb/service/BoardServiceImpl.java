package com.shb.service;

import java.io.*;
import java.util.*;


import javax.servlet.http.*;


import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;


import com.shb.dao.*;
import com.shb.domain.*;
import com.shb.dto.*;
import com.shb.mapper.*;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public ArrayList<BoardVo> getBoardList() {
		
		return boardMapper.getList();
	}
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Override
	public int insertBoard(Board board, MultipartFile files,HttpSession sess) {
		
		
			
		UploadFile uploadFile = new UploadFile();
		//파일업로드
		long fileSize = files.getSize();		
		
		if(fileSize > 0){				
			
				
			String UploadPath = sess.getServletContext().getRealPath("resources/upload/");							
			log.info("파일 업로드 경로: " + UploadPath);
			
			String fileName = files.getOriginalFilename();
			//중북방지
			UUID uid = UUID.randomUUID();
			
			String saveFileName = uid.toString() + "_" + fileName;
			
			File saveFile = new File(UploadPath,saveFileName);
			
			//UploadPath,saveFileName 파일경로를 더해서 이어준다
			try {
				files.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			uploadFile.setFileName(fileName);
			uploadFile.setSaveFileName(saveFileName);
			uploadFile.setFileSize(Long.toString(fileSize));
			uploadFile.setFileType(files.getContentType());
			uploadFile.setFilePath(UploadPath);
															
		}													

		return dao.insertBoard(board, uploadFile);
	}	

	@Override
	public void updateBoard(Board board) {
		dao.updateBoard(board);		
		
		
			
		
	}

	@Override
	public int deleteBoard(int bno) {
		
		return dao.deletBoard(bno);
	}

	@Override
	public Board getBoard(int bno) {
		
		return dao.getBoard(bno);
	}
	
	@Override
	public BoardFileVo getBoard2(int bno) {
		
		return boardMapper.getBoard(bno);
	}

	@Override
	public Board[] searchBoard(String criteria, String keyword) {
		
		return null;
	}

}
