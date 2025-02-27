package com.sp.app.mypage.controller;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.SessionInfo;
import com.sp.app.mypage.controller.dto.request.SellerRequest;
import com.sp.app.mypage.controller.dto.response.CategoryResponse;
import com.sp.app.mypage.service.SellerServiceInterFace;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/mypage/seller")
@RequiredArgsConstructor
@Slf4j
public class SellerController {

    private final SellerServiceInterFace sellerService;
    private final StorageService storageService;
    private final PaginateUtil paginateUtil;
    private final MyUtil myUtil;

    private String uploadPath;

    @PostConstruct
    public void init() {
        uploadPath = storageService.getRealPath("/uploads/seller");
    }

    @GetMapping("/info")
    public ModelAndView main() {
        return new ModelAndView("mypage/seller/seller_main");
    }

    @GetMapping("/registration")
    public ModelAndView registrationPage(){
        ModelAndView mav = new ModelAndView("mypage/seller/auction/auction_registration");

        CategoryResponse respList = sellerService.findByAllCategory();

        mav.addObject("category", respList);
        mav.addObject("mode", "write");

        return mav;
    }

    @PostMapping("/write")
    public ModelAndView writeSubmit(SellerRequest dto,
                              HttpSession session, HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();
        try {
            SessionInfo info = (SessionInfo)session.getAttribute("member");

            dto.setUserId(info.getNum());

            sellerService.insertPrize(dto, uploadPath);

        } catch (Exception e) {
            log.info("writeSubmit : ", e);
        }

        mav.setViewName("redirect:/mypage/seller/info");
        return mav;
    }


}
