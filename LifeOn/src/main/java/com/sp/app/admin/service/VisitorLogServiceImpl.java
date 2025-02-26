package com.sp.app.admin.service;

import org.springframework.stereotype.Service;

import com.sp.app.admin.mapper.VisitorLogMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VisitorLogServiceImpl implements VisitorLogService {

	private final VisitorLogMapper visitorLogMapper;

	@Override
	public void insertVisitorLog(String sessionId) {
		visitorLogMapper.insertVisitorLog(sessionId);
	}

	@Override
	public int countTodayVisitors() {
		return visitorLogMapper.countTodayVisitors();
	}

	@Override
	public int countTotalVisitors() {
		return visitorLogMapper.countTotalVisitors();
	}

	@Override
	public int countTotalMembers() {
		return visitorLogMapper.countTotalMembers();
	}

	@Override
	public int countTodayNewMembers() {
		return visitorLogMapper.countTodayNewMembers();
	}
	
	
}
