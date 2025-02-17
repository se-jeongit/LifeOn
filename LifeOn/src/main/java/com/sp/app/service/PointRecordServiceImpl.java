package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.PointRecordMapper;
import com.sp.app.model.PointRecord;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PointRecordServiceImpl implements PointRecordService {

	private final PointRecordMapper mapper;
	
	@Override
	public List<PointRecord> listPoint(Map<String, Object> map) {
		List<PointRecord> list = null;
		
		try {
			list = mapper.listPoint(map);
		} catch (Exception e) {
			log.info("listPoint : ", e);
		}
	
		return list;
	}
	
	
	@Override
	public int totalPoint(long num) {
		int tpoint = 0;
		
		try {
			tpoint = mapper.totalPoint(num);
		} catch (Exception e) {
			log.info("totalPoint : ", e);
		}
		
		return tpoint;
	}

	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}
		
		return result;
	}




}
