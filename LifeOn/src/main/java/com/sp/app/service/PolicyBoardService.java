package com.sp.app.service;

import com.sp.app.model.PolicyBoard;

public interface PolicyBoardService {
	public void insertPolicy(PolicyBoard dto, String uploadPath) throws Exception;
	
}
