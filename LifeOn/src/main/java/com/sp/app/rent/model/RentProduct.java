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
	private long pnum; // 상품번호 // PRODCUT_PICTURE
	private String ptype; // 상품유형 : 물품대여
	private String pname; // 상품명
	private String pct; // 상품내용
	private String pph; // 썸네일사진 : 파일경로저장
	
	private long num; // 회원번호
	
	// 카테고리 테이블
	// CATEGORY_BIG
	private int cbn; // 카테고리 대분류 번호 // CATEGORY_SMALL
	private String cbc; // 카테고리 대분류 상세
	
	// CATEGORY_SMALL
	private int csn; // 카테고리 소분류 번호 // PRODUCT
	private String csc; // 카테고리 소분류 상세
	
	// 상품사진 테이블 PRODCUT_PICTURE
	private long ppnum; // 상품사진번호
	private String ppp; // 서버에 저장된 파일경로
	private List<MultipartFile> selectFile;
	
	// 물품대여 상품정보 PRODUCT_RENT
	private int prp; // 대여비
	private int prq; // 대여수량
	private String prd; // 상품등록날짜 : SYSDATE(DEFAULT)
	private String prsd; // 상품대여시작일
	private String pred; // 상품대여종료일
	private int prlp; // 연체료 : 0(DEFAULT)
	
	private String prs; // 대여상태 : 대여가능, 대여중, 대여불가능
	private String pra; // 거래위치
	private String prad; // 거래상세주소
}
