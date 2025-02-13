package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.PolicyBoard;
import com.sp.app.model.PolicyBoardFile;

@Mapper
public interface PolicyBoardMapper {
	public void insertPolicy(PolicyBoard dto) throws SQLException;
	public void updatePolicyBoard(PolicyBoard dto) throws SQLException;
	public void updatePolicyBoardFile(PolicyBoardFile dto) throws SQLException;
	
	public void deletePolicy(long num) throws SQLException;
	
	public void insertPolicyFile(PolicyBoardFile fdto);
	public int dataCount(Map<String, Object> map);
	public List<PolicyBoard> listPolicy(Map<String, Object> map);
	
	
	public void updateHitCount(long num) throws SQLException;
	public PolicyBoard findById(Long num);
	public PolicyBoard findByPrev(Map<String, Object> map);
	public PolicyBoard findByNext(Map<String, Object> map);
}
