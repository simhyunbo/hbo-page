package com.shb.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.shb.dao.*;
import com.shb.dto.*;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	CodeDao dao;
	
	@Override
	public Code[] getCodeList(String category)  {
		
		return dao.getCodeList(category);
	}

}
