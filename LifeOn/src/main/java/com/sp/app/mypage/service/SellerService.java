package com.sp.app.mypage.service;

import com.sp.app.common.StorageService;
import com.sp.app.exception.StorageException;
import com.sp.app.mapper.AuctionMapper;
import com.sp.app.mapper.SellerMapper;
import com.sp.app.mypage.controller.dto.request.SellerRequest;
import com.sp.app.mypage.controller.dto.response.CategoryResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;
import java.util.HashMap;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class SellerService implements SellerServiceInterFace {

    private final AuctionMapper mapper;
    private final SellerMapper sellerMapper;
    private final StorageService  storageService;


    @Override
    public CategoryResponse findByAllCategory() {

        CategoryResponse resp = new CategoryResponse();

        resp.setSmallCategory(Optional.ofNullable(mapper.findByAllCategorySmall(new HashMap<>())).orElse(Collections.emptyList()));
        resp.setBigCategory(Optional.ofNullable(mapper.findByAllCategoryBig()).orElse(Collections.emptyList()));

        return resp;
    }

    @Override
    public void insertPrize(SellerRequest dto, String uploadPath) throws Exception {
        try {
            //TODO 썸네일 가공작업 해야함

//            long seq = mapper.FreeBoardSeq();
//            dto.setPsnum(seq);?????

            String startDate;
            String endDate;

            int startHour = Integer.parseInt(dto.getStartDateHH());
            int endHour = Integer.parseInt(dto.getEndDateHH());

            if (dto.getStartDateTime().equalsIgnoreCase("pm") && startHour > 12) {
                startHour += 12;
            } else if (dto.getStartDateTime().equalsIgnoreCase("am") && startHour <= 12) {
                startHour = 0;
            }

            if (dto.getEndDateTime().equalsIgnoreCase("pm") && endHour > 12) {
                endHour += 12;
            } else if (dto.getEndDateTime().equalsIgnoreCase("am") && endHour <= 12) {
                endHour = 0;
            }

            startDate = String.format("%s %02d:%02d:00", dto.getStartDate(), startHour, Integer.parseInt(dto.getStartDateMM()));
            endDate = String.format("%s %02d:%02d:00", dto.getEndDate(), endHour, Integer.parseInt(dto.getEndDateMM()));

            dto.setStartDate(startDate);
            dto.setEndDate(endDate);


                //썸네일
                String filename = storageService.uploadFileToServer(dto.getThumbnailFile(), uploadPath);
                dto.setThumbnail(filename);

            //sellerMapper.insertPrize(dto);

            if (! dto.getSelectFile().isEmpty()) {
                insertFile(dto, uploadPath);
            }

        } catch (Exception e) {
            log.info("insertBoard : " + e);

            throw e;
        }
    }


    protected void insertFile(SellerRequest dto, String uploadPath) throws Exception {
        for (MultipartFile mf : dto.getSelectFile()) {
            try {

                String saveFilename =  Objects.requireNonNull(storageService.uploadFileToServer(mf, uploadPath));

                dto.setPicPath(saveFilename);

                //mapper.updateFile(dto);
//                sellerMapper.insertFile(dto);

            } catch (NullPointerException e) {
            } catch (StorageException e) {
            } catch (Exception e) {
                throw e;
            }
        }
    }
}
