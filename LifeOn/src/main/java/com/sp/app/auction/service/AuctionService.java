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
    public AllCategoryResponse findByAllCategory(Map<String, Object> paginationMap) {

        AllCategoryResponse categoryResponse = new AllCategoryResponse();
        categoryResponse.setCategoryList(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));
        List<PrizeRep> prizeReps = mapper.findByAllPrize(paginationMap);
        categoryRepeat(paginationMap, prizeReps);
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
        categoryRepeat(map, prizeReps);
        categoryResponse.setPrizeList(filterPrize(prizeReps));

        return categoryResponse;
    }

    @Override
    public PrizeDetailRep findByPrize(Map<String, Object> map) {

        List<String> prizeImg = mapper.findByPrizeImg(map);

        PrizeDetailRep result = mapper.findByPrize(map);
        mapInToData(map, result.getPnum(), result.getStDate(), result.getEdDate(), result.getPrStatus(), result.getPrice());
        result.setPrStatus(updatePrizeStatusMethod(map));

        result.setUpToDate(result.getUpToDate().substring(0, 16));

        result.setPrImgList(prizeImg);


        return result;
    }

    @Override
    public String biddingMoney(Map<String, Object> map){
        int priceCompare = mapper.findByPrize(map).getPrice();
        int price = (int) map.get("price");
        if (priceCompare > price) {
            return "입찰금액이 현재금액보다 작습니다. 다시 입찰해주세요.";
        }
        Integer s = mapper.findByBidding(map);
        map.put("price", price);
        if (s == 0){
            mapper.insertBidding(map);
            mapper.updatePrizePrice(map);
        } else {
            mapper.updateBidding(map);
            mapper.updatePrizePrice(map);
        }

        return "입찰에 성공하였습니다.";
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

    @Override
    public void updatePrizeStatus(Map<String, Object> map) {
        mapper.updateFinalPrizeStatus(map);
    }

    // 가격 회원번호 상품번호 등을 받아서 입찰을 진행하는 메소드
    @Override
    public Long findByUserId(Map<String, Object> map) {
        return mapper.findByUserId(map);
    }

    protected  List<List<PrizeRep>> filterPrize(List<PrizeRep> prizeReps) {

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

    protected  void categoryRepeat(Map<String, Object> map, List<PrizeRep> prizeReps) {
        for (PrizeRep prizeRep : prizeReps) {
            mapInToData(map, prizeRep.getPnum(), prizeRep.getStDate(), prizeRep.getEdDate(), prizeRep.getPrStatus(), prizeRep.getPrice());
            prizeRep.setPrStatus(updatePrizeStatusMethod(map));
        }
    }


    protected  void mapInToData(Map<String, Object> map, long pnum, String stDate, String edDate, String prStatus, int price) {
        map.put("pnum", pnum);
        map.put("stDate", stDate);
        map.put("edDate", edDate);
        map.put("status", prStatus);
        map.put("price", Integer.parseInt(String.valueOf(price))); // price를 숫자 형식으로 변환
    }


    protected  String updatePrizeStatusMethod(Map<String, Object> map) {
        if (map.get("status").equals("진행전")
                && updateSchedule.updatePrize(map.get("stDate").toString())) {
            map.put("status", "진행중");
            updatePrizeStatus(map);
            return "진행중";
        } else if (map.get("status").equals("진행중")
                && updateSchedule.updatePrize(map.get("edDate").toString())) {
            map.put("status", "마감");
            map.put("userId",findByUserId(map));
            updatePrizeStatus(map);
            mapper.insertProductBiddingSuccess(map);
            return "마감";
        }
        return map.get("status").toString();
    }




}
