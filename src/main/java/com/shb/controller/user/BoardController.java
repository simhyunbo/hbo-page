package com.shb.controller.user;


import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.shb.controller.admin.HomeController;
import com.shb.dto.*;
import com.shb.service.*;


@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@Autowired
	private FileService fileService;
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("boardList")
	public void getboard(Board board,Model model) {
		
		model.addAttribute("board", bs.getBoardList());
		}
	
	@RequestMapping("view")
	public void view(@ModelAttribute("bno") int bno,Model model) {
		//String bno 이름을 같게해주면 받아온다 = view.jsp에 있는 bno를 받아온다 
		
		
		
		//model.addAttribute("board",bs.getBoard(bno));
		
		//mybatis형태
		model.addAttribute("board",bs.getBoard(bno));
					
		

	}
	
	@GetMapping("regForm")
	public void regForm() {		
	}
	
	@PostMapping("register")
	public String register(Board board, MultipartFile files, HttpSession sess,RedirectAttributes rttr) {
//		log.info("제목:" + board.getTitle());
//		log.info("내용:" + board.getTitle());
//		
//		log.info("첨부파일 이름 : " + files.getOriginalFilename());
//		log.info("첨부파일 크기 : " + files.getSize());
//		log.info("첨부파일 타입 : " + files.getContentType());
		board.setId((String)sess.getAttribute("sess_id"));
		
		int bno = bs.insertBoard(board,files,sess);
		
		fileService.fileUpload(files, sess, bno);
		
		rttr.addFlashAttribute("bno", bno);
		
		return "redirect:/board/view";
	}
	
	@RequestMapping("boardModifyForm")
	public void modifyform(Board board, Model model,UploadFile file) {
		model.addAttribute("board",board);
		model.addAttribute("uploadFile", file);
	}
	
	@RequestMapping("modify")
	//input에 있는 name과 MultipartFile의 files 이름이 같아야 한다
	public String modify(Board board,MultipartFile files,RedirectAttributes rttr,HttpSession sess) {
		
		
	
		bs.updateBoard(board);
		System.out.println("files" + files);
		int bno = board.getBno();
		log.info("보드bno {}", bno);
		
		//파일이 없는 경우와 
		if(files != null && files.getSize() > 0) {
			fileService.fileUpload(files, sess, bno);
		}
		//수정이 끝난다음 넘겨주는법
		rttr.addFlashAttribute("bno",bno);
		return "redirect:/board/view";
	}
	
	@RequestMapping("delete")
	public String delete(int bno,String saveFileName,HttpSession sess) {
		
		
		if(saveFileName != null) {
			//파일삭제
			String uploadPath = sess.getServletContext().getRealPath("resources/upload/");
			fileService.fileDel(uploadPath, saveFileName);
			
			 //파일 레코드삭제
			fileService.fileDelete(bno);
		}
		
		//보드삭제
		bs.deleteBoard(bno);		
		
		return "redirect:/board/boardList";
	
		
	}
}

//@WebServlet(urlPatterns = {"*.bo"})
//public class BoardController extends HttpServlet {
//	
//	private static final long serialVersionUID = 1L;
//       
//	private BoardService board = new BoardServiceImpl();	
// 
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doAction(request, response);
//	}	
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
//		doAction(request, response);
//	}
//	
//	private void doAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		
//		response.setContentType("text/html; charset=utf-8");		
//		request.setCharacterEncoding("utf-8");				
//		
//		String uri = request.getRequestURI();
//		String cmd = uri.substring(uri.lastIndexOf("/")+1);
//		
//		//System.out.println("CONTEXT정보" + request.getContextPath());
//		
//		System.out.println("URI : " + cmd);		
//		//System.out.println(uri.lastIndexOf("?")); 
//		
//				
//		//게시판 리스트 출력
//		if(cmd.equals("boardList.bo")) {
//			ArrayList<Board> b = board.getBoardList();
//			request.setAttribute("board", b);
//			goView(request, response, "/WEB-INF/views/user/board/boardList.jsp");
//		} else if(cmd.equals("boardRegForm.bo")) {
//			goView(request, response, "/WEB-INF/views/user/board/boardRegForm.jsp");
//		} else if(cmd.equals("boardRegProc.bo")) {									
//						
//			int bno = board.insertBoard(request, response);			
//			
//			Board b2= board.getBoard(bno);
//			
//			request.setAttribute("board", b2);
//			goView(request, response, "/WEB-INF/views/user/board/boardDetailView.jsp");
//			
//		} else if(cmd.equals("boardDetailView.bo")) {
//			int bno = Integer.parseInt(request.getParameter("bno"));
//			
//			Board b2= board.getBoard(bno);
//			request.setAttribute("board", b2);			
//			goView(request, response, "/WEB-INF/views/user/board/boardDetailView.jsp");
//
//		} else if(cmd.equals("boardModifyForm.bo")) {
//			
//			Board b = setBoard(request);
//		
//			request.setAttribute("board", b);			
//			goView(request, response, "/WEB-INF/views/user/board/boardModifyForm.jsp");
//		} else if(cmd.equals("updateBoard.bo")) {			
//			Board b = setBoard(request);
//			System.out.println(b);
//			board.updateBoard(b);
//			request.setAttribute("board", b);
//			goView(request, response, "/WEB-INF/views/user/board/boardDetailView.jsp");
//		} else if(cmd.equals("boardDelete.bo")) {
//			
//			int rs = board.deleteBoard(Integer.parseInt(request.getParameter("bno")));			
//			request.setAttribute("delstat", rs);
//			System.out.println("삭제여부:" + rs);
//			goView(request, response, "boardList.bo");
//		}
//	}
//		
//	private Board setBoard(HttpServletRequest request) {		
//		Board b = new Board();
//		b.setBno(Integer.parseInt(request.getParameter("bno")));
//		b.setTitle(request.getParameter("title"));			
//		b.setContent(request.getParameter("content"));
//		b.setCount(Integer.parseInt(request.getParameter("count")));
//		b.setWdate(request.getParameter("wdate"));
//		b.setId(request.getParameter("writer"));
//		
//		return b;
//	}
//
//
//	private void goView(HttpServletRequest request, HttpServletResponse response, String viewPage) throws ServletException, IOException {		
//		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
//		rd.forward(request, response);
//	}
//
//}
