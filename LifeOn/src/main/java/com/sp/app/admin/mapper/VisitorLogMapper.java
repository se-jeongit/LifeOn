package com.sp.app.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.admin.model.VisitorLog;

@Mapper
public interface VisitorLogMapper {

	//방문 로그 추가(INSERT)
	void insertVisitorLog(String sessionId);
	
	//  모든 방문 로그 조회 (SELECT)
	List<VisitorLog> findAll();
	
	
	// 오늘 방문자 수 조회(SELECT)
	int countTodayVisitors();
	
	
	// 누적 방문자수 조회(SELECT)
	int countTotalVisitors();
}
