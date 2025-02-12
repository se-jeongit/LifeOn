package com.sp.app.lounge.service;

import java.util.List;
import java.util.Map;

import com.sp.app.lounge.model.FreeBoard;
import com.sp.app.lounge.model.FreeReply;

public interface FreeBoardService {
	public void insertBoard(FreeBoard dto, String uploadPath) throws Exception;
	public List<FreeBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public FreeBoard findById(long num);
	public void updateHitCount(long num) throws Exception;
	public FreeBoard findByPrev(Map<String, Object> map);
	public FreeBoard findByNext(Map<String, Object> map);
	public void updateBoard(FreeBoard dto, String uploadPath) throws Exception;
	public void deleteBoard(long num, String uploadPath, String id, int grade) throws Exception;

	public boolean deleteUploadFile(String uploadPath, String filename);
	
	// 게시글 좋아요
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long num);
	public boolean isMemberBoardLiked(Map<String, Object> map);
	
	// 댓글
	public void insertReply(FreeReply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<FreeReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 댓글 좋아요
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}
