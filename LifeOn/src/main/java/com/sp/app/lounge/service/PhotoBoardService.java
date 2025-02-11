package com.sp.app.lounge.service;

import java.util.List;
import java.util.Map;

import com.sp.app.lounge.model.PhotoBoard;

public interface PhotoBoardService {
	public void insertBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public List<PhotoBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public PhotoBoard findById(long psnum);
	public void updateHitCount(long cpfname) throws Exception;
	public PhotoBoard findByPrev(Map<String, Object> map);
	public PhotoBoard findByNext(Map<String, Object> map);
	public void updateBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public void deleteBoard(long psnum, String uploadPath, String userId, int userLevel) throws Exception;

}
