package com.sp.app.auction.response;

import com.sp.app.auction.vo.CategoryBig;
import com.sp.app.auction.vo.CategorySmall;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BigCategoryResponse {
    private long cbn;
    private List<CategoryBig> categoryList;
    private String categoryType;



}
