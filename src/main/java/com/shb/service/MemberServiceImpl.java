package com.shb.service;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.shb.dao.*;
import com.shb.dto.*;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao mdao;	
	
	@Override
	public int insert(Member member) {						
		return mdao.insertMember(member);
	}
	
	
//	public Member setMember(Member member) {
//		Member m = new Member();
//		
//		String email = member.getEmail()("eid") + "@" + request.getParameter("domain");
//		m.setEmail(email);
//		m.setIntro(request.getParameter("intro"));
//		
//		String[] hobby = request.getParameterValues("hobby");			
//		m.setHobby(hobby);
//		
//		CodeDao c = new CodeDao();
//		Code[] code = c.getCodeList("hobby");
//		String[] hobbyName = new String[hobby.length];		
//		
//		for(int i=0; i < hobby.length; i++ ) {			
//			for(int j=0; j< code.length; j++) {
//				if(code[j].getCodeVal().equals(hobby[i])) {
//					hobbyName[i] = code[j].getCodeName();
//					break;
//				}
//			}
//		}
//		m.setHobbyName(hobbyName);
//		
//		return m;
//	}
//	

	@Override
	public int update(Member member) {
		
		String email = member.getEid() + "@" +member.getDomain();
		member.setEmail(email);
		int rs = mdao.updateMember(member);
		
		
		return rs;
	}

	@Override
	public int delete(String id) {		
		return mdao.deleteMember(id);
	}

	@Override
	public Member[] select() {		
		return mdao.getMemberList();
	}

	@Override
	public Map<String, String> loginService(Member member) {					
		return mdao.loginProc(member);		
	}

	@Override
	public int idDoubleCheck(String id) {
		
		return mdao.idDoubleCheck(id);
	}

	@Override
	public Member getMember(String id) {
		
		return mdao.getMember(id);
	}


	@Override
	public Map<String, String> adminloginService(Member member) {
		
		return mdao.adminloginProc(member);
	}

}
