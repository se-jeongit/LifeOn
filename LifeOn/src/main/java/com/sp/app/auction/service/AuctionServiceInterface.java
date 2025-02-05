package com.sp.app.auction.service;

import com.sp.app.auction.response.BigCategoryResponse;
import com.sp.app.auction.response.SmallCategoryResponse;
import com.sp.app.auction.vo.CategoryBig;
import com.sp.app.auction.vo.CategorySmall;

import java.util.List;
import java.util.Map;

public interface AuctionServiceInterface {

    BigCategoryResponse findByAllCategoryBig();
    SmallCategoryResponse findByAllCategorySmall(Map<String, Object> map);

    CategorySmall findByCategorySmall(Map<String, Object> map);


}
