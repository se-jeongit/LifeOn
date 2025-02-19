package com.sp.app.auction.service;

import com.sp.app.auction.response.category.AllCategoryResponse;
import com.sp.app.auction.response.category.BigCategoryResponse;
import com.sp.app.auction.response.prize.PrizeDetailRep;
import com.sp.app.auction.response.prize.PrizeRep;
import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.common.UpdateSchedule;
import com.sp.app.mapper.AuctionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuctionService implements AuctionServiceInterface{

    private final AuctionMapper mapper;
    private final UpdateSchedule updateSchedule = new UpdateSchedule();


    @Override
    public List<List<PrizeRep>> findByAllPrize() {

        //List<PrizeRep> prizeReps = mapper.findByAllPrize();

        //return filterPrize(prizeReps);

        return null;
    }


    @Override
    public AllCategoryResponse findByAllCategory(Map<String, Object> paginationMap) {

        AllCategoryResponse categoryResponse = new AllCategoryResponse();
        categoryResponse.setCategoryList(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));
        List<PrizeRep> prizeReps = mapper.findByAllPrize(paginationMap);
        for (PrizeRep prizeRep : prizeReps) {
            prizeRep.setPrStatus(updatePrizeStatusMethod(
                    prizeRep.getPrStatus(), prizeRep.getStDate(), prizeRep.getEdDate(),prizeRep.getPnum()
            ));
        }
        categoryResponse.setPrizeList(filterPrize(prizeReps));
        return categoryResponse;

    }



    @Override
    public BigCategoryResponse findByAllCategoryBig(Map<String, Object> map) {

        BigCategoryResponse categoryResponse = new BigCategoryResponse();
        List<CategorySmall> categorySmalls = Optional.ofNullable(mapper.findByAllCategorySmall(map)).orElse(Collections.emptyList());

        Long cbnLong = (Long) map.get("cbn");
        int cbn = cbnLong.intValue();
        categoryResponse.setCbn(cbn);

        categoryResponse.setCategoryList(categorySmalls);

        List<PrizeRep> prizeReps = mapper.findByBigCategory(map);
        for (PrizeRep prizeRep : prizeReps) {
            prizeRep.setPrStatus(updatePrizeStatusMethod(
                    prizeRep.getPrStatus(), prizeRep.getStDate(), prizeRep.getEdDate(),prizeRep.getPnum()
            ));
        }

        categoryResponse.setPrizeList(filterPrize(prizeReps));

        return categoryResponse;
    }

    @Override
    public PrizeDetailRep findByPrize(Map<String, Object> map) {

        List<String> prizeImg = mapper.findByPrizeImg(map);

        PrizeDetailRep result = mapper.findByPrize(map);

        result.setPrStatus(updatePrizeStatusMethod(
                result.getPrStatus(), result.getStDate(), result.getEdDate(),result.getPnum()
        ));


        result.setUpToDate(result.getUpToDate().substring(0, 16));

        result.setPrImgList(prizeImg);


        return result;
    }


    @Override
    @Transactional(readOnly = true)
    public int dataCount(Map<String, Object> map) {
        int result = 0;

        try {
            result = mapper.dataCount(map);
        } catch (Exception e) {
            log.info("dataCount : ", e);
        }

        return result;
    }


    // TODO : 리스트를 불러올때 상태값을 확인하여 상태값을 변경해주는 메소드 아직 미완성
    @Override
    public void updatePrizeStatus(String status,long prId) {
        Map<String, Object> map = new HashMap<>();
        map.put("status", status);
        map.put("prId", prId);
        mapper.updatePrizeStatus(map);

    }


    private List<List<PrizeRep>> filterPrize(List<PrizeRep> prizeReps) {

        List<PrizeRep> filter = new ArrayList<>();

        List<List<PrizeRep>> resultList = new ArrayList<>();
        
        int cnt = 1;
        for (PrizeRep prizeRep : prizeReps) {
            filter.add(prizeRep);
            if (cnt % 4 == 0) {
                resultList.add(filter);
                filter = new ArrayList<>();
            }
            cnt++;
        }
        if (cnt > 0) {
            resultList.add(filter);
        }

        return resultList;
    }

    private String updatePrizeStatusMethod(String status, String stDate, String edDate,long prId) {
        if (status.equals("진행전") && updateSchedule.updatePrize(stDate)) {
            updatePrizeStatus("진행중", prId);
            return "진행중";
        } else if (status.equals("진행중") && updateSchedule.updatePrize(edDate)) {
            updatePrizeStatus("마감", prId);
            return "마감";
        }
        return status;
    }


}
