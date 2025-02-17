package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.PointRecord;

public interface PointRecordService {
	public List<PointRecord> listPoint(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int totalPoint(long num);
}
