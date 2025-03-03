package com.sp.app.mapper;

import com.sp.app.model.LendingPage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {


    List<LendingPage> findByInterior(Map<String, Object> map);
    List<LendingPage> findByEvent(Map<String, Object> map);
    List<LendingPage> findByTip(Map<String, Object> map);

    List<LendingPage> findByPrizeMain(Map<String, Object> map);
    List<LendingPage> findByRegion(Map<String, Object> map);
    List<LendingPage> findByRegionMeeting(Map<String, Object> map);

    List<LendingPage> findByPolicy(Map<String, Object> map);


}
