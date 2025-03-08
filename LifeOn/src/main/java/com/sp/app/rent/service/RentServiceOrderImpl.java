package com.sp.app.rent.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.rent.mapper.RentOrderMapper;
import com.sp.app.rent.model.RentProduct;
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
				dto.setPretp(myPoint - dto.getOp());
				dto.setPrep(-dto.getOp());
				
				mapper.insertPoint(dto);
				mapper.insertRentProductOrder(dto);
				mapper.updateStatus(dto);
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
		// TODO Auto-generated method stub
		
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
	public List<RentProduct> listRentProductOrder(Map<String, Object> map) {
		List<RentProduct> list = null;
		
		try {
			list = mapper.listRentProductOrder(map);
			
		} catch (Exception e) {
			log.info("listRentProductOrder : ", e);
		}
		
		return list;
	}
}
