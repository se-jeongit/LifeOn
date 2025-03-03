package com.sp.app.service.home;

import com.sp.app.model.LendingPage;

import java.util.List;
import java.util.Map;

public interface HomeServiceInterFace {

    List<LendingPage> findByInterior(Map<String, Object> map);
    List<LendingPage> findByEvent(Map<String, Object> map);
    List<LendingPage> findByTip(Map<String, Object> map);

    List<LendingPage> findByPrizeMain(Map<String, Object> map);
    List<LendingPage> findByRegion(Map<String, Object> map);
    List<LendingPage> findByRegionMeeting(Map<String, Object> map);

    List<LendingPage> findByPolicy(Map<String, Object> map);


}
