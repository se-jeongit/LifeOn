package com.sp.app.auction.response.category;

import com.sp.app.auction.vo.CategorySmall;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class FinalCategoryRep {
    private long cbn;
    private long csn;
    private List<CategorySmall> categoryList;
    private String categoryType;
    private String categoryName;



}
