package com.sp.app.mypage.service;

import com.sp.app.mypage.controller.dto.request.SellerRequest;
import com.sp.app.mypage.controller.dto.response.CategoryResponse;

public interface SellerServiceInterFace {

    CategoryResponse findByAllCategory();

    void insertPrize(SellerRequest dto, String uploadPath) throws Exception;


}
