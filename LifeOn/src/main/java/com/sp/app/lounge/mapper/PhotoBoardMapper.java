package com.sp.app.lounge.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.model.PhotoReply;

@Mapper
public interface PhotoBoardMapper {
	public void insertBoard(PhotoBoard dto) throws SQLException;
	public void updateBoard(PhotoBoard dto) throws SQLException;
	public void deleteBoard(long psnum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<PhotoBoard> listBoard(Map<String, Object> map);

	public PhotoBoard findById(Long num);
	public void updateHitCount(long num) throws SQLException;
	public PhotoBoard findByPrev(Map<String, Object> map);
	public PhotoBoard findByNext(Map<String, Object> map);
	
	public void BoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long num);
	
	public void Reply(PhotoReply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<PhotoReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void ReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}
