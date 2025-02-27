package com.sp.app.rent.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RentProduct {
	// 상품정보 통합테이블 PRODUCT
	private long pnum; // 상품번호 // PRODUCT_PICTURE
	private String ptype; // 상품유형 : 물품대여
	private String pname; // 상품명
	private String pct; // 상품내용
	private String pph; // 썸네일사진 : 파일경로저장
	private MultipartFile pphFile;
	
	private long num; // 회원번호
	
	// 카테고리 테이블
	// CATEGORY_BIG
	private long cbn; // 카테고리 대분류 번호 // CATEGORY_SMALL
	private String cbc; // 카테고리 대분류 상세
	
	// CATEGORY_SMALL
	private long csn; // 카테고리 소분류 번호 // PRODUCT
	private String csc; // 카테고리 소분류 상세
	
	// 하위 카테고리
	private List<RentProductSub> listSub;
	
	// 상품사진 테이블 PRODUCT_PICTURE
	private long ppnum; // 상품사진번호
	private String ppp; // 서버에 저장된 파일경로
	private List<MultipartFile> selectFile;
	
	// 물품대여 상품정보 PRODUCT_RENT
	private int prp; // 대여비(1일기준)
	private String prd; // 상품등록날짜 : SYSDATE(DEFAULT)
	private String prsd; // 상품대여시작일
	private String pred; // 상품대여종료일
	
	private String prs; // 대여상태 : 대여가능, 대여중, 대여불가능
	private String pra; // 거래위치
	private String prad; // 거래상세주소
	
	private int prlp; // 보증금
	// 대여종료일 후 반납하지 않고 연락 두절인 경우 받는 금액
	private String prld; // 연체기간
	// 대여종료일 후 반납하지 않을 경우 일자를 저장하여 그 기간만큼 1일 대여비를 환불받을 보증금에서 제외
}
