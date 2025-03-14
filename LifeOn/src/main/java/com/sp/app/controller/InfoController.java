package com.sp.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class InfoController {

    @GetMapping("lifeon/info")
    public ModelAndView handleHome() {
        ModelAndView mav = new ModelAndView("main/info");

        return mav;
    }
}