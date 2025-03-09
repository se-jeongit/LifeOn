package com.sp.app.rent.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.rent.mapper.RentOrderMapper;
import com.sp.app.rent.model.RentProductOrder;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RentServiceOrderImpl implements RentServiceOrder{
	private final RentOrderMapper mapper;
	
	@Override
	public String insertRentProductOrder(RentProductOrder dto) throws Exception {
		try {
			int myPoint = mapper.memberPoint(dto.getNum());
			
			if (myPoint >= dto.getOp()) {
				dto.setPrep(-dto.getOp());
				dto.setPretp(myPoint - dto.getOp());
				
				mapper.insertPoint(dto);
				mapper.insertRentProductOrder(dto);
				mapper.updateStatus(dto);
				
				dto.setSellerNum(mapper.sellerNum(dto.getPnum()));
				myPoint = mapper.memberPoint(dto.getSellerNum());
				dto.setPrep(dto.getOdp() * dto.getOdq());
				dto.setPretp(myPoint + dto.getPrep());
				mapper.sellerInsertPoint(dto);
				
			} else {
				return "noPoint";
			}
			
		} catch (Exception e) {
			log.info("insertRentProductOrder : ", e);
			return "false";
		}
		
		return "true";
	}
	
	@Override
	public void updateRentProductOrder(RentProductOrder dto) throws Exception {
		// TODO 반납이 완료될 경우 보증금처리, 반납되지 않을 경우 연체기간 업데이트
		
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}

		return result;
	}
	
	@Override
	public List<RentProductOrder> listRentProductOrder(Map<String, Object> map) {
		List<RentProductOrder> list = null;
		
		try {
			list = mapper.listRentProductOrder(map);
			
		} catch (Exception e) {
			log.info("listRentProductOrder : ", e);
		}
		
		return list;
	}
}
