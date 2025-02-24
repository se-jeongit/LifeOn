package com.sp.app.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Order;

@Mapper
public interface OrderMapper {
	public void insertOrder(Order dto);
	public void insertOrderDetail(Order dto);
	
}
