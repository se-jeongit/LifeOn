package com.sp.app.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	//DELETE(재고 + 상품통합 + 사진)
	public void deleteProductImage(long pnum) throws SQLException;
	public void deleteStock(long pnum) throws SQLException;
	public void deleteProduct(long pnum) throws SQLException;
	
	public List<ProductManage> listProductFile(long pnum);
	
	//INSERT(공동구매)
	public void insertTogetherProduct(ProductManage dto) throws SQLException;
	
	//UPDATE(공동구매)
	public void updateTogetherProduct(ProductManage dto) throws SQLException;
	
	//UPDATE(수량)
	public void updateTogetherQuantity(@Param("pnum") long pnum, @Param("odq") int odq) throws SQLException;


	//DELETE(공동구매)
	public void deleteTogetherProduct(long pnum) throws SQLException;
	
	//UPDATE(재고량) - 공동구매성공시
	public void updateSaleComplete(long pnum) throws SQLException;
	public void updateSaleStatus(long pnum);
	
	
	//재고 list(관리자)
	public int dataCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	
	//공동구매 list(관리자)
	public int dataCount2(Map<String, Object> map);
	public List<ProductManage> listTogetherProduct(Map<String, Object> map);
	
	public ProductManage findByPnum(long pnum);
	
	//공동구매 list(사용자)
	public int dataCount3(Map<String, Object> map);
	
	
	
	//status 구매성공 업데이트
	public void updateStatus(@Param("pnum") long pnum, @Param("status") String status);
	
	
	//status 업데이트
	public void updateStatusIng();
	public void updateStatusFail();
	
	
	
}
