package com.sp.app.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.PolicyBoard;

@Mapper
public interface PolicyBoardMapper {
	public void insertBoard(PolicyBoard dto) throws SQLException;
	
}
