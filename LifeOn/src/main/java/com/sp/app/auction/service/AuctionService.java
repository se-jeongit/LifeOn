package com.sp.app.auction.service;

import com.sp.app.auction.response.category.BigCategoryResponse;
import com.sp.app.auction.response.category.FinalCategoryRep;
import com.sp.app.auction.response.category.SmallCategoryResponse;
import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.mapper.AuctionMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuctionService implements AuctionServiceInterface{

    private final AuctionMapper mapper;

    @Override
    @Transactional(readOnly = true)
    public BigCategoryResponse findByAllCategoryBig() {

        BigCategoryResponse categoryResponse = new BigCategoryResponse();

        categoryResponse.setCategoryList(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));

        return categoryResponse;

    }

    @Override
    @Transactional(readOnly = true)
    public SmallCategoryResponse findByAllCategorySmall(Map<String, Object> map) {

        SmallCategoryResponse categoryResponse = new SmallCategoryResponse();

        categoryResponse.setCategoryList(Optional.ofNullable(mapper.findByAllCategorySmall(map)).orElse(Collections.emptyList()));

        return categoryResponse;
    }

    @Override
    @Transactional(readOnly = true)
    public FinalCategoryRep findByCategorySmall(Map<String, Object> map) {
        return null;
    }


}
