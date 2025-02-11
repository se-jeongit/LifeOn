package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.PolicyBoard;

public interface PolicyBoardService {
	public void insertPolicy(PolicyBoard dto, String uploadPath) throws Exception;
	public List<PolicyBoard> listPolicy(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
