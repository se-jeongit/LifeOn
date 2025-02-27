package com.sp.app.admin.service;

import java.time.LocalDate;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;


import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.ApplicationScope;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@Service
@ApplicationScope
public class VisitorCounter implements HttpSessionListener{
	
	//누적 방문자 수 (전체 고유 세션 수)
	private final AtomicInteger totalVisitors = new AtomicInteger(0);
	
	//오늘 방문자 수를 위한 세션 ID 저장 
	private final Map<LocalDate, Set<String>> dailyVisitors = new ConcurrentHashMap<>();
	
	//현재 활성 세션 수
	private final AtomicInteger activeVisitors = new AtomicInteger(0);
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// 활성 세션 증가
		activeVisitors.incrementAndGet();
		
		HttpSession session = event.getSession();
		String sessionId = session.getId();
		
		// 세션에 최초 방문 여부 확인용 속성 설정
		if(session.getAttribute("COUNTED") == null) {
			session.setAttribute("COUNTED", true);
			totalVisitors.incrementAndGet();
		}
		
		// 오늘 날짜 기준 방문자 수 계산
		LocalDate today = LocalDate.now();
		dailyVisitors.computeIfAbsent(today, k -> ConcurrentHashMap.newKeySet()).add(sessionId);
		
		
		// 어제 이전 데이터 정리 
		cleanupOldDate();
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		// 활성 세션 감소
		activeVisitors.decrementAndGet();
	}
	
	// 오래된 일별 방문자 데이터 정리 (최근 30일만 유지)
	private void cleanupOldDate() {
		LocalDate thirtyDaysAgo = LocalDate.now().minusDays(30);
		dailyVisitors.keySet().removeIf(date -> date.isBefore(thirtyDaysAgo));
	}
	
	// 총 누적 방문자 수 반환
	public int getTotalVisitorCount() {
		return totalVisitors.get();
	}
	
	//오늘 방문자 수 반환
	public int getTodayVisitorCount() {
		LocalDate today = LocalDate.now();
		Set<String> visitors = dailyVisitors.get(today);
		return visitors != null ? visitors.size() : 0;
	}
	
	// 현재 활성 방문자 수 반환
	public int getActiveVisitorCount() {
		return activeVisitors.get();
	}
}
