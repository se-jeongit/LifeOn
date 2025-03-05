package com.sp.app.service.home;

import com.sp.app.mapper.HomeMapper;
import com.sp.app.model.LendingPage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class HomeService implements HomeServiceInterFace{

    private final HomeMapper homeMapper;

    @Override
    public List<LendingPage> findByInterior() {

        try {
            return Optional.ofNullable(homeMapper.findByInterior()).orElse(Collections.emptyList());
        }catch (Exception e) {
            log.info("findByInterior : {}", e.getMessage());
            return null;
        }

    }

    @Override
    public List<LendingPage> findByEvent() {

        try {
            return Optional.ofNullable(homeMapper.findByEvent()).orElse(Collections.emptyList());
        }catch (Exception e) {
            log.info("findByEvent : {}", e.getMessage());
            return null;
        }

    }

    @Override
    public List<LendingPage> findByTip() {
        try {
            List<LendingPage> result = Optional.ofNullable(homeMapper.findByTip()).orElse(Collections.emptyList());

            for (LendingPage lendingPage : result) {
                String content = lendingPage.getContent();
                if(content.length() > 50) {
                    lendingPage.setContent(content.substring(0, 50) + ".....");
                }
                lendingPage.setRegDate(removeTime(lendingPage.getRegDate()));
            }

            return result;
        }catch (Exception e) {
            log.info("findByTip : {}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<LendingPage> findByPrizeMain() {
        try {
            List<LendingPage> result = Optional.ofNullable(homeMapper.findByPrizeMain()).orElse(Collections.emptyList());

            LocalDate today = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (LendingPage lendingPage : result) {
                LocalDateTime endDateTime = LocalDateTime.parse(lendingPage.getRegDate(), formatter);
                LocalDate endDate = endDateTime.toLocalDate();
                long daysLeft = ChronoUnit.DAYS.between(today, endDate);
                lendingPage.setRegDate(String.valueOf(daysLeft));
            }

            return result;
        }catch (Exception e) {
            log.info("findByPrizeMain : {}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<LendingPage> findByRegion() {
        try {
            return Optional.ofNullable(homeMapper.findByRegion()).orElse(Collections.emptyList());
        }catch (Exception e) {
            log.info("findByRegion : {}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<LendingPage> findByRegionMeeting() {
        try {

            List<LendingPage> result = Optional.ofNullable(homeMapper.findByRegionMeeting()).orElse(Collections.emptyList());

            for (LendingPage lendingPage : result) {
                String content = lendingPage.getContent();
                if(content.length() > 30) {
                    lendingPage.setContent(content.substring(0, 30) + ".....");
                }
                lendingPage.setRegDate(removeTime(lendingPage.getRegDate()));
            }

            return result;
        }catch (Exception e) {
            log.info("findByRegionMeeting : {}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<LendingPage> findByPolicy() {
        try {
            return Optional.ofNullable(homeMapper.findByPolicy()).orElse(Collections.emptyList());
        }catch (Exception e) {
            log.info("findByPolicy : {}", e.getMessage());
            return null;
        }
    }


    public String removeTime(String dateTimeStr) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, formatter);
        return dateTime.toLocalDate().toString();
    }




}



