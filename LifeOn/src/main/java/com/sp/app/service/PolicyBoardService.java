package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.PolicyBoard;

public interface PolicyBoardService {
	public void insertBoard(PolicyBoard dto, String uploadPath) throws Exception;
	public List<PolicyBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public PolicyBoard findById(long num);
	public void updateHitCount(long num) throws Exception;
	public PolicyBoard findByPrev(Map<String, Object> map);
	public PolicyBoard findByNext(Map<String, Object> map);
	
	public void updateBoard(PolicyBoard dto, String uploadPath) throws Exception;
	public boolean deleteUploadFile(String uploadPath, String filename);

	public void deleteBoard(long num, String uploadPath, String id, int grade) throws Exception;
}
