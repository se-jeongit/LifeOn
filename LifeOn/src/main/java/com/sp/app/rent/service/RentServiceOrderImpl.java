package com.sp.app.rent.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
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
	private final StorageService storageService;
	
	@Override
	public void insertRentProductOrder(RentProductOrder dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void updateRentProductOrder(RentProductOrder dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<RentProduct> listRentProductOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
