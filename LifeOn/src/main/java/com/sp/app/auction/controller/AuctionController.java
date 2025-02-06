package com.sp.app.auction.controller;


import com.sp.app.auction.request.CategoryRequest;
import com.sp.app.auction.response.category.BigCategoryResponse;
import com.sp.app.auction.response.category.FinalCategoryRep;
import com.sp.app.auction.response.category.SmallCategoryResponse;
import com.sp.app.auction.service.AuctionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/auction/*")
@RequiredArgsConstructor
public class AuctionController {

    private final AuctionService auctionService;

    @GetMapping()
    public ModelAndView moveMain(){

        ModelAndView mav = new ModelAndView("auction/auction_main");

        BigCategoryResponse bigCategory = auctionService.findByAllCategoryBig();


        mav.addObject("category", bigCategory);

        return mav;
    }

    //TODO: 카테고리 검색어 입력시 처리동작 처리 미처리 상태
    @PostMapping(value = "/category", consumes = "application/x-www-form-urlencoded")
    public ResponseEntity<?> handleCategoryRequest(CategoryRequest categoryRequest) {

        try {
            if (categoryRequest.getCategoryType().equals("big")) {
                BigCategoryResponse categories = auctionService.findByAllCategoryBig();
                categories.setCategoryType("big");
                categories.setCbn(0);
                return ResponseEntity.ok(categories);
            } else if (categoryRequest.getCategoryType().equals("small")) {
                Map<String, Object> map = Map.of("cbn", categoryRequest.getCbn());
                SmallCategoryResponse categories = auctionService.findByAllCategorySmall(map);
                categories.setCategoryType("small");
                categories.setCbn(categoryRequest.getCbn());
                return ResponseEntity.ok(categories);
            } else if (categoryRequest.getCategoryType().equals("final")) {
                Map<String, Object> map = new HashMap<>();
                FinalCategoryRep categories = new FinalCategoryRep();

                categories.setCategoryType("final");
                categories.setCategoryName(categoryRequest.getCategoryName());

                return ResponseEntity.ok(categories);
            }
        } catch (Exception e) {
            log.error("error", e);
        }

        return ResponseEntity.badRequest().build();
    }
}
