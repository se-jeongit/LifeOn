package com.sp.app.mapper;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.PolicyBoard;

@Mapper
public interface PolicyBoardMapper {
	public void insertBoard(PolicyBoard dto) throws SQLException;
	public void updateBoard(PolicyBoard dto) throws SQLException;
	public int dataCount(Map<String, Object> map);
	public List<PolicyBoard> listBoard(Map<String, Object> map);
	
	public PolicyBoard findById(Long num);
	public void updateHitCount(long num) throws SQLException;
	public PolicyBoard findByPrev(Map<String, Object> map);
	public PolicyBoard findByNext(Map<String, Object> map);
	
	public void deleteBoard(long num) throws SQLException;
	
	public void insertBoardLike(Map<String, Object> map) throws SQLException;
	public void deleteBoardLike(Map<String, Object> map) throws SQLException;
	public int boardLikeCount(long num);
	public PolicyBoard userBoardLike(Map<String, Object> map);
	
}
