package com.sp.app.lounge.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.lounge.model.FreeBoard;
import com.sp.app.lounge.model.FreeReply;

@Mapper
public interface FreeBoardMapper {
	public void insertBoard(FreeBoard dto) throws SQLException;
	public void updateBoard(FreeBoard dto) throws SQLException;
	public void deleteBoard(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<FreeBoard> listBoard(Map<String, Object> map);
	
	public FreeBoard findById(Long num);
	public void updateHitCount(long num) throws SQLException;
	public FreeBoard findByPrev(Map<String, Object> map);
	public FreeBoard findByNext(Map<String, Object> map);
	
	// 게시글 좋아요
	public void insertBoardLike(Map<String, Object> map) throws SQLException;
	public void deleteBoardLike(Map<String, Object> map) throws SQLException;
	public int boardLikeCount(long num);
	public FreeBoard memberBoardLiked(Map<String, Object> map);
	
	// 댓글
	public void insertReply(FreeReply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<FreeReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	// 댓글 좋아요
	public void insertReplyLike(Map<String, Object> map) throws SQLException;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	public Optional<Integer> memberReplyLiked(Map<String, Object> map);
}
