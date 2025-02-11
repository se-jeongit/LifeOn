package com.sp.app.lounge.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.lounge.model.PhotoBoard;

@Mapper
public interface PhotoBoardMapper {
	public void insertBoard(PhotoBoard dto) throws SQLException;
	public void updateBoard(PhotoBoard dto) throws SQLException;
	public void deleteBoard(long psnum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<PhotoBoard> listBoard(Map<String, Object> map);
}
