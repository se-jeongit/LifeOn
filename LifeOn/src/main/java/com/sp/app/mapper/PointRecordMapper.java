package com.sp.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.PointRecord;

@Mapper
public interface PointRecordMapper {
	public int dataCount(Map<String, Object> map);
	public List<PointRecord> listPoint(Map<String, Object> map);
	public int totalPoint(long num);
}
