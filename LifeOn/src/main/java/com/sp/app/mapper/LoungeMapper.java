package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Lounge;

@Mapper
public interface LoungeMapper {
	public void insertBoard(Lounge dto) throws SQLException;
	public void updateBoard(Lounge dto) throws SQLException;
	public void deleteBoard(long psnum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Lounge> listBoard(Map<String, Object> map);
}
