package com.sp.app.rent.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.rent.model.RentProduct;

@Mapper
public interface RentMapper {
	// 상품번호
	public Long productSeq();
	
	// 대여물품 등록
	public void insertRentProduct(RentProduct dto) throws SQLException;
	public void insertRentProductFile(RentProduct dto) throws SQLException;
	
	// 대여물품 수정
	public void updateRentProduct(RentProduct dto) throws SQLException;
	
	// 대여물품 삭제
	public void deleteRentProduct(long productNum) throws SQLException;
	
	public List<RentProduct> listProductFile(long productNum);
	public RentProduct findByFileId(long fileNum);
	public void deleteRentProductFile(Map<String, Object> map) throws SQLException;
	
	// 대여물품 리스트 조회
	public int dataCount(Map<String, Object> map); // 리스트에 출력되는 물품개수
	public List<RentProduct> listRentProduct(Map<String, Object> map); // 전체 물품 리스트
	public List<RentProduct> bestListRentProduct(Map<String, Object> map); // 베스트 물품 리스트
	
	public RentProduct findById(long productNum); // 선택한 물품정보 보기
	public List<RentProduct> findByMemberProduct(Map<String, Object> map); // 판매자가 파는 물품리스트 
	
	// 대여물품 찜하기
	public void insertMemberLikeProduct(Map<String, Object> map) throws SQLException;
	public void deleteMemberLikeProduct(Map<String, Object> map) throws SQLException;
	public int productLikeCount(long num);
	public RentProduct memberProductLiked(Map<String, Object> map);
	
	// 상품 카테고리 목록
	public RentProduct findByCategory(long categoryNum);
	public List<RentProduct> listCategory(); // 대분류
	public List<RentProduct> listSubCategory(long categoryNum); // 소분류
	
	// 대여물품 신청하면 판매가 확인 후 대여시작날짜, 대여종료날짜 업데이트
	// 대여상태(대여가능, 대여중, 대여불가능) 업데이트
	// 연체된 경우 연체기간, 보증금 업데이트
}
