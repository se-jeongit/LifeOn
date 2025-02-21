package com.sp.app.mypage.service;

import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.mapper.AuctionMapper;
import com.sp.app.mypage.controller.dto.response.CategoryResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class SellerService implements SellerServiceInterFace {

    private final AuctionMapper mapper;

    @Override
    public CategoryResponse findByAllCategory() {

        CategoryResponse resp = new CategoryResponse();

        resp.setSmallCategory(Optional.ofNullable(mapper.findByAllCategorySmall(new HashMap<>())).orElse(Collections.emptyList()));
        resp.setBigCategory(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));

        return resp;
    }
}
