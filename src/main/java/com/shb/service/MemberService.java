package com.shb.service;

import java.util.*;

import javax.servlet.http.*;

import com.shb.dto.*;



public interface MemberService {
	
	//회원등록
	int insert(Member member);
	
	//회원수정
	int update(Member member);
	
	//회원삭제
	int delete(String id);
	
	//회원조회
	Member[] select();

	//로그인
	Map<String, String> loginService(Member member);

	//id중복검사
	int idDoubleCheck(String id);

	//1인 회원 조회
	Member getMember(String id);

	Map<String, String> adminloginService(Member member);		
}
