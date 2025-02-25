package com.sp.app.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.admin.mapper.ProductManageMapper;
import com.sp.app.admin.model.ProductManage;
import com.sp.app.admin.service.ProductManageService;
import com.sp.app.mapper.OrderMapper;
import com.sp.app.model.Order;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor 
@Slf4j
public class OrderServiceImpl implements OrderService {
	private final OrderMapper mapper;
	private final ProductManageService productService;
	private final ProductManageMapper mapper2;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			
			productService.updateTogtherQuantity(dto.getPnum(), dto.getOdq()); //수량 업데이트
			
			dto.setOdpp(0); //배송비
			dto.setOup(dto.getOp()); // 사용한 포인트
			dto.setOfp(dto.getOfp()+ dto.getOdpp()); // 총결제금액
			
			mapper.insertOrder(dto);
			mapper.insertOrderDetail(dto);

			//status 업데이트
			ProductManage pm = productService.findByPnum(dto.getPnum());
			if(pm.getPttq() == mapper.getTotalOdq(dto.getPnum())) { //목표수량 == 총 구매수량
				pm.setStatus("구매성공");
				mapper2.updateStatus(dto.getPnum(), pm.getStatus());
			}
		} catch (Exception e) {
			log.info("insertOrder : " , e);
			throw e;
		}
	}

}
