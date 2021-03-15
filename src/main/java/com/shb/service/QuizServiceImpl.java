package com.shb.service;

import java.util.*;


import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.shb.dao.*;
import com.shb.dto.*;

@Service
public class QuizServiceImpl implements QuizService{

	@Autowired
	private QuizDao dao;
	
	@Override
	public ArrayList<Quiz> getQuizList() {
		
		return dao.getQuizList();
	}

//	@Override
//	public int insertQuiz(HttpServletRequest request, HttpServletResponse response) {
//		
//String CHARSET = "utf-8";
//		
//		Quiz q = new Quiz();	
//		q.setId((String)request.getSession().getAttribute("sess_id"));
//		
//		UploadFile f = new UploadFile();
//
//		ServletContext ctx = request.getSession().getServletContext();		
//		String fileUploadPath = ctx.getRealPath("/upload");	
//		
//		System.out.print("파일 경로:" + fileUploadPath);
//				
//		try {						
//			DiskFileUpload upload = new DiskFileUpload();
//			List<FileItem> items = upload.parseRequest(request);
//			
//			for(FileItem item : items) {				
//				if(item.isFormField()){
//					System.out.printf("필드이름 : %s, 필드 값 : %s\n", item.getFieldName(), item.getString(CHARSET));
//					
//					if(item.getFieldName().equals("title")) {
//						q.setTitle(item.getString(CHARSET)); 
//					}			
//					
//					if(item.getFieldName().equals("content")) { 
//						q.setContent(item.getString(CHARSET)); 
//					}			
//					
//				} else {			 
//					//파일업로드
//					long fileSize = item.getSize();
//					System.out.println("업드 파일사이즈 : " + fileSize);
//					
//					if(fileSize > 0){
//						String fileName = item.getName();
//						System.out.println("업로드 파일이름 : " + fileName);								
//						
//						//중복된 파일을 업로드 하지 않기 위해 uid값 생성
//						UUID uid = UUID.randomUUID();
//						
//						int idx = fileName.lastIndexOf(".");				
//						String split_fileName = fileName.substring(0, idx);
//						String split_extension = fileName.substring(idx+1);
//						
//						String saveFileName = split_fileName + "_" + uid.toString() + "." + split_extension;  
//						
//						System.out.printf("저장될 파일명 : %s, idx값: %d", saveFileName, idx);
//						
//						File file = new File(fileUploadPath + File.separator + saveFileName);														
//						
//						item.write(file);													
//												
//						f.setFileName(fileName);
//						f.setSaveFileName(saveFileName);
//						f.setFileSize(Long.toString(fileSize));
//						f.setFileType(item.getContentType());
//						f.setFilePath(fileUploadPath);								
//					}													
//				}				
//			}
//			
//		} catch (FileUploadException e) {			
//			e.printStackTrace();
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		} catch (Exception e) {			
//			e.printStackTrace();
//		}	
//
//		
//		return dao.insertQuiz(q, f);
//	}
//
//	@Override
//	public Quiz getQuiz(int qno) {
//		
//		return dao.getQuiz(qno);
//	}
//
//	@Override
//	public Quiz nextquiz() {
//		
//		return dao.nextquiz();
//	}

}
