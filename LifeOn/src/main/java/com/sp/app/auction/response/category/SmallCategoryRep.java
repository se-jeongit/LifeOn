package com.sp.app.auction.response.category;

import com.sp.app.auction.response.prize.PrizeRep;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SmallCategoryRep {
    private long cbn;
    private long csn;
    private String categoryType;
    private String categoryBigName;
    private String categoryName;
    private List<List<PrizeRep>> prizeList;



}
