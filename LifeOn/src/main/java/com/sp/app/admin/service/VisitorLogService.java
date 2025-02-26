package com.sp.app.admin.service;

public interface VisitorLogService {

	//방문 로그 추가
	void insertVisitorLog(String sessionId);
	
	//오늘 방문자 수 조회
	int countTodayVisitors();
	
	//누적 방문자 수
	int countTotalVisitors();
	
	//총 회원수
	int countTotalMembers();
	
	//오늘 가입자 
	int countTodayNewMembers();
}
