package com.sp.app.rent.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.rent.model.RentProduct;

@Mapper
public interface RentMapper {
	// 대여물품 등록
	public void insertRentProduct(RentProduct dto, String uploadPath) throws SQLException;
	
	// 대여물품 수정
	public void updateRentProduct(RentProduct dto, String uploadPath) throws SQLException;
	
	// 대여물품 삭제
	public void deleteRentProduct(long productNum, String uploadPath) throws SQLException;
	public void deleteRentProductFile(long fileNum, String pathString) throws SQLException;
	
	// 대여물품 리스트 조회
	public int dataCount(Map<String, Object> map); // 리스트에 출력되는 물품개수
	public List<RentProduct> listRentProduct(Map<String, Object> map); // 전체 물품 리스트
	
	public RentProduct findById(long productNum); // 선택한 물품정보 보기
	public RentProduct findByPrev(Map<String, Object> map); // 이전 물품
	public RentProduct findByNext(Map<String, Object> map); // 다음 물품
	
	// 상품 카테고리 목록
	public List<RentProduct> listCategory(); // 대분류
	public List<RentProduct> listSubCategory(long CategorybigNum); // 소분류
	
	// 대여물품 신청하면 판매가 확인 후 대여시작날짜, 대여종료날짜 업데이트
	// 대여상태(대여가능, 대여중, 대여불가능) 업데이트
	// 연체된 경우 연체기간, 보증금 업데이트
}
