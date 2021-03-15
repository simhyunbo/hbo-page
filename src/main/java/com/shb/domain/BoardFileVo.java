package com.shb.domain;

import com.shb.dto.*;

public class BoardFileVo {

	private BoardVo boardVo;
	private UploadFile uploadFile;
	
	
	public BoardVo getBoardVo() {
		return boardVo;
	}
	public void setBoardVo(BoardVo boardVo) {
		this.boardVo = boardVo;
	}
	public UploadFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(UploadFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	 
	
}
