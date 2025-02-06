package com.sp.app.auction.service;

import com.sp.app.auction.response.category.BigCategoryResponse;
import com.sp.app.auction.response.category.FinalCategoryRep;
import com.sp.app.auction.response.category.SmallCategoryResponse;
import com.sp.app.auction.vo.CategorySmall;

import java.util.Map;

public interface AuctionServiceInterface {

    BigCategoryResponse findByAllCategoryBig();
    SmallCategoryResponse findByAllCategorySmall(Map<String, Object> map);

    FinalCategoryRep findByCategorySmall(Map<String, Object> map);


}
