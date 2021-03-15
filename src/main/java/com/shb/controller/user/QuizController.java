package com.shb.controller.user;



import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.shb.dto.*;
import com.shb.service.*;





@Controller
@RequestMapping(value="/quiz/")
public class QuizController {
	
	@Autowired
	private QuizService quizService;
	
	@GetMapping("quizlist")
	public void getquiz(Quiz quiz,Model model) {
		
		
		model.addAttribute("quiz",quizService.getQuizList());
	}
	


//@WebServlet(urlPatterns = {"*.qo"})
//public class QuizController extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//	
//	final QuizService qs = new QuizServiceImpl();
//       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
//		doAction(request, response);		
//	}
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
//		PrintWriter out = response.getWriter();
//		
//		
//		String uri = request.getRequestURI();
//		String cmd = uri.substring(uri.lastIndexOf("/")+1);
//				
//		System.out.println("URI : " + cmd);
//		String viewPage = null;
//				
//		if(cmd.equals("quizlist.qo")) {  
//			ArrayList<Quiz> q = qs.getQuizList();
//			request.setAttribute("quiz", q);
//			goView(request, response, "/quiz/quizlist.jsp");
//		
//			
//		}else if(cmd.equals("quizRegForm.qo")) {
//			
//			goView(request, response, "/quiz/quizRegForm.jsp");
//		
//		}else if(cmd.equals("quizRegProc.qo")) {
//			int qno = qs.insertQuiz(request,response);			
//			Quiz q = qs.getQuiz(qno);	
//			System.out.println(q);
//			request.setAttribute("quiz", q);
//			goView(request, response, "/quiz/quizDetailView.jsp");
//		}	else if(cmd.equals("quizDetailView.qo")) {
//			int qno = Integer.parseInt(request.getParameter("seqno"));
//			System.out.println(qno);
//			Quiz q = qs.getQuiz(qno);
//			System.out.println(q);
//			request.setAttribute("quiz", q);
//			goView(request, response, "/quiz/quizDetailView.jsp");
//		} else if(cmd.equals("quiznext.qo")) {
//			Quiz q = qs.nextquiz();
//			request.setAttribute("quiz", q);
//			goView(request, response, "/quiz/quizDetailView.jsp");
//		}
//	}
//
//	
//	private void goView(HttpServletRequest request, HttpServletResponse response, String viewPage) throws ServletException, IOException {		
//		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
//		rd.forward(request, response);
//	}
	
	
}





