package com.sp.app.mapper;

import com.sp.app.auction.vo.CategoryBig;
import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Mapper
public interface AuctionMapper {

    List<CategoryBig> findByAllCategoryBig();
    List<CategorySmall> findByAllCategorySmall(Map<String, Object> map);

    CategorySmall findByCategorySmall(Map<String, Object> map);




}
