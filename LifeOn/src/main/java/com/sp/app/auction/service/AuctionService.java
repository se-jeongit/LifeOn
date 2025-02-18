package com.sp.app.auction.service;

import com.sp.app.auction.response.category.AllCategoryResponse;
import com.sp.app.auction.response.category.SmallCategoryRep;
import com.sp.app.auction.response.category.BigCategoryResponse;
import com.sp.app.auction.response.prize.PrizeDetailRep;
import com.sp.app.auction.response.prize.PrizeRep;
import com.sp.app.auction.vo.CategorySmall;
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

    @Override
    public List<List<PrizeRep>> findByAllPrize() {

        List<PrizeRep> prizeReps = mapper.findByAllPrize();

        return filterPrize(prizeReps);


    }


    @Override
    @Transactional(readOnly = true)
    public AllCategoryResponse findByAllCategory() {

        AllCategoryResponse categoryResponse = new AllCategoryResponse();
        categoryResponse.setCategoryList(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));
        List<PrizeRep> prizeReps = mapper.findByAllPrize();

        categoryResponse.setPrizeList(filterPrize(prizeReps));

        return categoryResponse;

    }

    @Override
    @Transactional(readOnly = true)
    public BigCategoryResponse findByAllCategoryBig(Map<String, Object> map) {

        BigCategoryResponse categoryResponse = new BigCategoryResponse();
        List<CategorySmall> categorySmalls = Optional.ofNullable(mapper.findByAllCategorySmall(map)).orElse(Collections.emptyList());

        Long cbnLong = (Long) map.get("cbn");
        int cbn = cbnLong.intValue();
        categoryResponse.setCbn(cbn);

        categoryResponse.setCategoryList(categorySmalls);


        List<PrizeRep> prizeReps = mapper.findByBigCategory(map);

        categoryResponse.setPrizeList(filterPrize(prizeReps));

        return categoryResponse;
    }

    @Override
    public PrizeDetailRep findByPrize(Map<String, Object> map) {

        List<String > prizeImg = mapper.findByPrizeImg(map);

        PrizeDetailRep result = mapper.findByPrize(map);

        result.setUpToDate(result.getUpToDate().substring(0, 16));

        result.setPrImgList(prizeImg);


        return result;
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


    private List<List<PrizeRep>> filterPrize(List<PrizeRep> prizeReps, Long categoryNum, String categoryType) {
        List<PrizeRep> filter = new ArrayList<>(4);
        List<List<PrizeRep>> resultList = new ArrayList<>();
        int filterSize = 0;
        for (PrizeRep prizeRep : prizeReps) {
                filter.add(prizeRep);
                filterSize++;
                if (filterSize == 4) {
                    resultList.add(filter);
                    filter = new ArrayList<>(4);
                    filterSize = 0;
                }
        }
        if (filterSize > 0) {
            resultList.add(filter);
        }

        return resultList;
    }
}
