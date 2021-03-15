package com.shb.service;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.http.*;


import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;


import com.shb.dao.*;
import com.shb.dto.*;


@Service
public class FileServiceImpl implements FileService {

	@Autowired
	FileDao fileDao;
	
	private static final Logger log = LoggerFactory.getLogger(FileServiceImpl.class);
	
	@Override
	public void fileUpload(MultipartFile files, HttpSession sess,int bno) {
		
		
		UploadFile uploadFile = new UploadFile();
		//파일업로드
		
		if(files != null){				
			
			long fileSize = files.getSize();		
				
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
			uploadFile.setBoardNo(Integer.toString(bno));
			
			fileDao.insertFile(uploadFile);
		}
		
		

	}

	
//	@Override
//	public void fileDown(HttpServletRequest request, HttpServletResponse response) {
//		
//		String filename = request.getParameter("filename");
//		String saveFileName = request.getParameter("savefilename");
//		//String filesize = request.getParameter("filesize");
//		//String filepath = request.getParameter("filepath");
//		String filetype = request.getParameter("filetype");
//		
//		String fileUploadPath = request.getSession().getServletContext().getRealPath("/upload");
//		
//		File file = new File(fileUploadPath + File.separator + saveFileName);
//		
//		try {
//			InputStream in = new FileInputStream(file);
//			OutputStream os = response.getOutputStream();
//			byte[] fileByte = new byte[(int)file.length()];	
//			
//			response.reset(); //이미 열려있는 출력스트림을 비우기 위해
//			
//			response.setContentType(filetype);
//			response.setContentLength(fileByte.length);
//			response.setHeader("Content-Disposition", "attachment; filename=\"" + 
//			                    URLEncoder.encode(filename, "UTF-8") + "\";");
//			response.setHeader("Content-Transfer-Encoding", "binary"); 		
//			
//			int leng = 0;	
//			while((leng = in.read(fileByte)) > 0){
//				os.write(fileByte, 0, leng);
//			}
//				
//			in.close();	
//			os.flush();
//			os.close();
//		} catch (FileNotFoundException e) {			
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}	
//	
//	}

	@Override
	public void fileDel(String uploadPath, String saveFileName) {		
		 
		File file = new File(uploadPath + File.separator + saveFileName);	
		 
		if(file.exists()) {
			//파일삭제
		 	file.delete();
		}
	}


	@Override
	public int fileDelete(int bno) {
		
		return  fileDao.deletFile(bno);
	}

}
