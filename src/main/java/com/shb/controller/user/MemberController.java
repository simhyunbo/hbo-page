package com.shb.controller.user;


import java.util.*;



import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.shb.controller.admin.HomeController;
import com.shb.dto.*;
import com.shb.service.*;




@Controller
public class MemberController {

	//의존성 주입 Spring bean 관리
	@Autowired
	private MemberService ms;
	
	
	@Autowired
	private CodeService code;
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);   
	@RequestMapping("member/login")
	public String login(Member member, HttpSession sess ,Model model){
		log.info("Member id :" + member.getId());
		log.info("Member pw :" + member.getPw());
		
		Map<String, String> map = ms.loginService(member);
				
		String viewPage = null;
		
				switch(map.get("stat")) {
				case "ok" : 
					
					sess.setAttribute("sess_id", member.getId());
					sess.setAttribute("sess_name", map.get("name"));
					viewPage = "redirect:/";
					break;				
				default : 
					model.addAttribute("loginStat","loginfail");
					viewPage = "index";
			}
		
		return viewPage;
	}
	
	@RequestMapping("member/logout")
	public String logout(HttpSession sess) {
		
		sess.invalidate();
		
		return  "redirect:/";
		
		
	}	

	@RequestMapping("member/myPage")
	public void myPage(Model model, HttpSession sess) {
		
		Member m = ms.getMember(sess.getAttribute("sess_id").toString());			
		model.addAttribute("member",m);
		
		
		model.addAttribute("hobby",code.getCodeList("hobby"));
		
	}
	
	@RequestMapping("member/modify")
	public String modify(Member member, Model model) {
		
		int rs = ms.update(member);
		
		if(rs>0) {
			model.addAttribute(member);
			model.addAttribute("hobby",code.getCodeList("hobby"));
		}
		return "member/memView";
	}
	
	@RequestMapping("member/delete")
	public String delete(HttpSession sess) {
		ms.delete(sess.getAttribute("sess_id").toString());
		
		
		
		return "redirect:/member/logout";
	}
	
	@RequestMapping("member/insert")
	public String insert(Member member,Model model) {
		
		int rs = ms.insert(member);
		model.addAttribute("isMemRegSuccess",rs);
		return "redirect:/";
		
	}
	@PostMapping("member/idDoubleCheck")
	public ResponseEntity<String> idDoubleCheck(@RequestParam("id") String id) {
		
		log.info("idDoubleCheck called... id : " + id);
		String rs = Integer.toString(ms.idDoubleCheck(id));
		return new ResponseEntity<String>(rs, HttpStatus.OK);
	}
	@RequestMapping("member/memReg")
	public String memreg() {
		return "/member/memRegForm";
	}
	
//	private void doAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//
//		response.setContentType("text/html; charset=utf-8");		
//		request.setCharacterEncoding("utf-8");		
//		
//		PrintWriter out = response.getWriter();
//		//w.append("<HTML><BODY><H2>�쉶�썝愿�由ъ꽌鍮꾩뒪</H2></body></html>");
//		
//		String uri = request.getRequestURI();
//		String cmd = uri.substring(uri.lastIndexOf("/")+1);
//				
//		System.out.println("URI : " + cmd);
//		String viewPage = null;
//				
//		if(cmd.equals("memReg.me")) {  //�쉶�썝�벑濡� �뤌 異쒕젰
//			viewPage ="/member/memRegForm.jsp";			
//			goView(request, response, viewPage);
//			
//		} else if(cmd.equals("memInsert.me")) {  //�쉶�썝�벑濡� 泥섎━ �슂泥�			
//			ms.insert(request);			
//			
//			//request.getSession().setAttribute("isMemRegSuccess", 1);			
//			response.sendRedirect("/index.jsp?isMemRegSuccess=1");
//
//			//request.setAttribute("isMemRegSuccess", 1);
//			//goView(request, response, "/");
//			
//		} else if(cmd.equals("idCheck.me")) { //id以묐났寃��궗
//			String id = request.getParameter("idstr");
//			int rs = ms.idDoubleCheck(id);
//			out.print(Integer.toString(rs));			
//			System.out.println(rs);
//		
//		} else if(cmd.equals("logout.me")) {
//			//�꽭�뀡�뙆愿댄븯怨� 猷⑦듃遺꾧린
//			HttpSession sess = request.getSession();
//			sess.invalidate();
//			response.sendRedirect("/");
//		} else if(cmd.equals("myPage.me")) {
//			Member m = ms.getMember(request.getSession().getAttribute("sess_id").toString());			
//			request.setAttribute("member", m);
//			
//			CodeService code = new CodeServiceImpl();
//			request.setAttribute("hobby", code.getCodeList("hobby"));
//			
//			goView(request, response, "/WEB-INF/views/user/member/myPage.jsp");
//		} else if(cmd.equals("memberModify.me")) {
//						
//			Member m = ms.update(request);
//			
//			request.setAttribute("member", m);
//			goView(request, response, "/WEB-INF/views/user/member/memModifyView.jsp");
//		}					
//	}
//
//	
//	private void goView(HttpServletRequest request, HttpServletResponse response, String viewPage) throws ServletException, IOException {		
//		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
//		rd.forward(request, response);
//	}
//	
	
}





