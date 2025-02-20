package com.sp.app.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.admin.model.ProductManage;

@Mapper
public interface ProductManageMapper {
	//카테고리
	public List<ProductManage> listBigCategory();
	public List<ProductManage> listSmallCategory(int cbn);
	
	//INSERT
	public void insertProduct(ProductManage dto) throws SQLException;
	public void insertStock(ProductManage dto) throws SQLException;
	public void insertProductImage(ProductManage dto) throws SQLException;
	
}
