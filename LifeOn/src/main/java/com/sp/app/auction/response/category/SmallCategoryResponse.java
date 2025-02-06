package com.sp.app.auction.response.category;

import com.sp.app.auction.vo.CategorySmall;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SmallCategoryResponse {
    private long cbn;
    private List<CategorySmall> categoryList;
    private String categoryType;

}
