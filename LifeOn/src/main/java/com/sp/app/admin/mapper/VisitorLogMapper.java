package com.sp.app.admin.mapper;



import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface VisitorLogMapper {

	//방문 로그 추가(INSERT)
	void insertVisitorLog(String sessionId);	
	
	// 오늘 방문자 수 조회(SELECT)
	int countTodayVisitors();
	
	
	// 누적 방문자수 조회(SELECT)
	int countTotalVisitors();
	
	// 총회원 
	int countTotalMembers();
	
	// 오늘 가입한 회원
	int countTodayNewMembers();
	
}
