package com.sp.app.lounge.service;

import java.util.List;
import java.util.Map;

import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.model.PhotoReply;

public interface PhotoBoardService {
	public void insertBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public List<PhotoBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public PhotoBoard findById(long num);
	public void updateHitCount(long num) throws Exception;
	public PhotoBoard findByPrev(Map<String, Object> map);
	public PhotoBoard findByNext(Map<String, Object> map);
	public void updateBoard(PhotoBoard dto, String uploadPath) throws Exception;
	public void deleteBoard(long num, String uploadPath, String userId, int userLevel) throws Exception;
	public boolean deleteUploadFile(String uploadPath, String filename);
	
	// 스크랩
	public void BoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long num);
	public boolean MemberBoardLiked(Map<String, Object> map);
	
	// 댓글
	public void Reply(PhotoReply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<PhotoReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void ReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws Exception;
}
