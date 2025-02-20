package com.sp.app.lounge.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.model.PhotoReply;

public interface PhotoBoardService {
	public void insertBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public void updateBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public void deleteBoard(String bdtype, long psnum, String nickname, int grade) throws Exception;
	public List<PhotoBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public PhotoBoard findById(Map<String, Object> map);
	public void updateHitCount(long num) throws Exception;
	public PhotoBoard findByPrev(Map<String, Object> map);
	public PhotoBoard findByNext(Map<String, Object> map);
	
	public void updateFile(PhotoBoard dto) throws SQLException;
	public List<PhotoBoard> listFile(long num);
	public PhotoBoard findByFileId(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

	public boolean deleteUploadFile(String uploadPath, String filename);
	// 스크랩
	public void boardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long num);
	public boolean memberBoardLiked(Map<String, Object> map);
	
	// 댓글
	public void reply(PhotoReply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<PhotoReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void replyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws Exception;
	
}
