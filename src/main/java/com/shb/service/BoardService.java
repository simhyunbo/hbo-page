package com.shb.service;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.web.multipart.*;

import com.shb.domain.*;
import com.shb.dto.*;



public interface BoardService {
	
	//게시판리스트
	ArrayList<BoardVo> getBoardList();
	
	//게시물 등록
	int insertBoard(Board board, MultipartFile files,HttpSession sess);
	
	//게시물 수정
	void updateBoard(Board board);
		
	//게시물 삭제
	int deleteBoard(int bno);
	
	//게시물 내용 확인
	Board getBoard(int bno);
	
	//mybatis 방식
	public BoardFileVo getBoard2(int bno);
	
	//게시물 검색
	Board[] searchBoard(String criteria, String keyword);
}
