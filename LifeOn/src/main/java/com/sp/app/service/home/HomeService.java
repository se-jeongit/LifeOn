package com.sp.app.service.home;

import com.sp.app.mapper.HomeMapper;
import com.sp.app.model.LendingPage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class HomeService implements HomeServiceInterFace{

    private final HomeMapper homeMapper;

    @Override
    public List<LendingPage> findByInterior(Map<String, Object> map) {



        return List.of();
    }

    @Override
    public List<LendingPage> findByEvent(Map<String, Object> map) {
        return List.of();
    }

    @Override
    public List<LendingPage> findByTip(Map<String, Object> map) {
        return List.of();
    }

    @Override
    public List<LendingPage> findByPrizeMain(Map<String, Object> map) {
        return List.of();
    }

    @Override
    public List<LendingPage> findByRegion(Map<String, Object> map) {
        return List.of();
    }

    @Override
    public List<LendingPage> findByRegionMeeting(Map<String, Object> map) {
        return List.of();
    }

    @Override
    public List<LendingPage> findByPolicy(Map<String, Object> map) {
        return List.of();
    }
}
