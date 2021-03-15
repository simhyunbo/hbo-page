package com.shb.controller.admin;



import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.shb.dto.*;
import com.shb.service.*;



@Controller
@RequestMapping(value="/admin/",method = RequestMethod.GET)
public class AdminController {
	
       
	@Autowired
	private MemberService memberService;
 
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	

	
	@PostMapping("login")
	public String login(Member member,HttpSession sess,Model model) {
		
		Map<String, String> map = memberService.adminloginService(member);
		
		String viewPage = null;
		
				switch(map.get("stat")) {
				case "ok" : 
					
					sess.setAttribute("sess_id", member.getId());
					sess.setAttribute("sess_name", map.get("name"));
					viewPage = "redirect:admi/admin_main";
					break;				
				default : 
					model.addAttribute("loginStat","loginfail");
					viewPage = "redirect:admi/admilogin";
			}
		
		return viewPage;
		
	}
	

	
	
	
}


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
//		if(cmd.equals("adminlogin.ao")) {
//			
//			RequestDispatcher rd = request.getRequestDispatcher("/admin/adminlogin.jsp");
//			
//			rd.forward(request, response);
//		}else if(cmd.equals("login.ao")) { 
//			String id = request.getParameter("id");
//			String pw = request.getParameter("pw");
//			Map<String, String> rs = ms.loginService(id, pw);
//			
//			switch(rs.get("stat")) {
//				case "ok" : 
//					HttpSession sess = request.getSession();
//					sess.setAttribute("sess_id", id);
//					sess.setAttribute("sess_name", rs.get("name"));
//					response.sendRedirect("/admin/admin_main.jsp");
//					break;				
//				default : 
//					request.setAttribute("loginStat", "loginfail");
//					goView(request, response, "/admin/adminlogin.jsp");		
//			}
//		} else if(cmd.equals("logout.ao")) {
//			
//			HttpSession sess = request.getSession();
//			sess.invalidate();
//			response.sendRedirect("/");
//			
//		}
//	
//	}
//
//	private void goView(HttpServletRequest request, HttpServletResponse response, String viewPage) throws ServletException, IOException {		
//		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
//		rd.forward(request, response);
//	}
//
//}
