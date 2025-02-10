package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.model.Lounge;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoungeServiceImpl implements LoungeService{

	@Override
	public void insertBoard(Lounge dto, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Lounge> listLounge(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Lounge findById(long psnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long cpfname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Lounge findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Lounge findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(Lounge dto, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(long psnum, String uploadPath, String userId, int userLevel) throws Exception {
		// TODO Auto-generated method stub
		
	}

}