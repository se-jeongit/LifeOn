package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Lounge;

public interface LoungeService {
	public void insertBoard(Lounge dto, String uploadPath) throws Exception;
	public List<Lounge> listLounge(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Lounge findById(long psnum);
	public void updateHitCount(long cpfname) throws Exception;
	public Lounge findByPrev(Map<String, Object> map);
	public Lounge findByNext(Map<String, Object> map);
	public void updateBoard(Lounge dto, String uploadPath) throws Exception;
	public void deleteBoard(long psnum, String uploadPath, String userId, int userLevel) throws Exception;

}
