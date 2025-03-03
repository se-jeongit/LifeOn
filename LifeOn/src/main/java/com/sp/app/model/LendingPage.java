package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LendingPage {

    private long num;
    private String nickname;

    private String subject;
    private String content;
    private int priceOrCount;
    private double disCountOrReview;
    private String regDate;



}
