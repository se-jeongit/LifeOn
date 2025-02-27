package com.sp.app.mapper;

import com.sp.app.mypage.controller.dto.request.SellerRequest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
    void  insertPrize(SellerRequest dto);

    void insertFile(SellerRequest dto);


}
