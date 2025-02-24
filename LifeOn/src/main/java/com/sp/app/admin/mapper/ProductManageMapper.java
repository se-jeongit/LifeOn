package com.sp.app.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.admin.model.ProductManage;

@Mapper
public interface ProductManageMapper {
	//카테고리
	public List<ProductManage> listBigCategory();
	public List<ProductManage> listSmallCategory(int cbn);
	
	//INSERT(재고 + 상품통합 + 사진)
	public void insertProduct(ProductManage dto) throws SQLException;
	public void insertStock(ProductManage dto) throws SQLException;
	public void insertProductImage(ProductManage dto) throws SQLException;
	
	//INSERT(공동구매)
	public void insertTogetherProduct(ProductManage dto) throws SQLException;
	
	//UPDATE(공동구매)
	public void updateTogetherProduct(ProductManage dto) throws SQLException;
	
	//DELETE(공동구매)
	public void deleteTogetherProduct(long pnum) throws SQLException;
	
	//재고 list
	public int dataCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	
	//공동구매 list
	public int dataCount2(Map<String, Object> map);
	public List<ProductManage> listTogetherProduct(Map<String, Object> map);
	
	public ProductManage findByPnum(long pnum);
	
	
	
	
}
