package com.sp.app.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.PolicyBoard;
import com.sp.app.model.PolicyBoardFile;

@Mapper
public interface PolicyBoardMapper {
	public void insertPolicy(PolicyBoard dto) throws SQLException;
	public void insertPolicyFile(PolicyBoardFile fdto);
}
