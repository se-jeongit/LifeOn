package com.sp.app.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.mapper.OrderMapper;
import com.sp.app.model.Order;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor 
@Slf4j
public class OrderServiceImpl implements OrderService {
	private final OrderMapper mapper;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			
			dto.setOdpp(0); //배송비
			dto.setOup(dto.getOp()); // 사용한 포인트
			dto.setOfp(dto.getOfp()+ dto.getOdpp()); // 총결제금액
			
			mapper.insertOrder(dto);
			mapper.insertOrderDetail(dto);
		} catch (Exception e) {
			log.info("insertOrder : " , e);
			throw e;
		}
	}

}
