package com.sp.app.mapper;

import com.sp.app.auction.response.prize.PrizeDetailRep;
import com.sp.app.auction.response.prize.PrizeRep;
import com.sp.app.auction.vo.CategoryBig;
import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface AuctionMapper {

    Integer dataCount(Map<String, Object> map);

    void updatePrizeStatus(Map<String, Object> map);

    List<PrizeRep> findByAllPrize(Map<String, Object> map);
    List<PrizeRep> findByBigCategory(Map<String, Object> map);

    List<CategoryBig> findByAllCategoryBig();
    List<CategorySmall> findByAllCategorySmall(Map<String, Object> map);

    PrizeDetailRep findByPrize(Map<String, Object> map);
    List<String> findByPrizeImg(Map<String, Object> map);






}
