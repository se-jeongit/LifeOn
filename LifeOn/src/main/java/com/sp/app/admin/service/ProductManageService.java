package com.sp.app.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.app.admin.model.ProductManage;

public interface ProductManageService {
	
	public List<ProductManage> listBigCategory();
	public List<ProductManage> listSmallCategory(int cbn);
	
	public void insertProduct(ProductManage dto, String uploadPath) throws Exception;
	public void insertTogetherProduct(ProductManage dto) throws Exception;
	
	public List<ProductManage> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
