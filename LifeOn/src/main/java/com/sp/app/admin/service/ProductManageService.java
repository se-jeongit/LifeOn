package com.sp.app.admin.service;

import java.util.List;

import com.sp.app.admin.model.ProductManage;

public interface ProductManageService {
	
	public List<ProductManage> listBigCategory();
	public List<ProductManage> listSmallCategory(int cbn);
	
	public void insertProduct(ProductManage dto, String uploadPath) throws Exception;
}
