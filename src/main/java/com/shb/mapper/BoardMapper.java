package com.shb.mapper;

import java.util.*;

import com.shb.domain.*;
import com.shb.dto.*;

public interface BoardMapper {

//	@Select("SELECT * FROM board WHERE rownum = 1")
	public ArrayList<BoardVo> getList();
	
	public BoardFileVo getBoard(int bno);
}
