package com.sp.app.rent.service;

import java.util.List;
import java.util.Map;

import com.sp.app.rent.model.RentProduct;

public interface RentService {
	// 상품 등록, 수정 삭제
	public void insertRentProduct(RentProduct dto, String uploadPath) throws Exception;
	// 사진등록
	public void updateRentProduct(RentProduct dto, String uploadPath) throws Exception;
	public void deleteRentProduct(long productNum, String uploadPath) throws Exception;
	public void deleteRentProductFile(long fileNum, String pathString) throws Exception;
	
	// 상품 조회
	public int dataCount(Map<String, Object> map);
	public List<RentProduct> listRentProduct(Map<String, Object> map);
	
	public RentProduct findById(long productNum);
	public RentProduct findByPrev(Map<String, Object> map);
	public RentProduct findByNext(Map<String, Object> map);
	
	// 상품 카테고리 목록
	public List<RentProduct> listCategory();
	public List<RentProduct> listSubCategory(long parentNum);
}
