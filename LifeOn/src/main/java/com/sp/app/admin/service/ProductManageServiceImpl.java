package com.sp.app.admin.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.admin.mapper.ProductManageMapper;
import com.sp.app.admin.model.ProductManage;
import com.sp.app.common.StorageService;
import com.sp.app.exception.StorageException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductManageServiceImpl implements ProductManageService{
	private final ProductManageMapper mapper;
	private final StorageService storageSerivce;
	@Override
	public List<ProductManage> listBigCategory() {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listBigCategory();
		} catch (Exception e) {
			log.info("listBigCategory : ", e);
		}
		return list;
	}

	@Override
	public List<ProductManage> listSmallCategory(int cbn) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listSmallCategory(cbn);
		} catch (Exception e) {
			log.info("listSmallCategory : ", e);
		}
		
		return list;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void insertProduct(ProductManage dto, String uploadPath) throws Exception {
		try {
			//썸네일
			String filename = storageSerivce.uploadFileToServer(dto.getPphFile(), uploadPath);
			dto.setPph(filename);
			
			mapper.insertProduct(dto);
			mapper.insertStock(dto);
			insertProductImage(dto, uploadPath);
		} catch (Exception e) { 
			log.info("insertProduct : " , e);
			throw e;
		}
	}
	
	protected void insertProductImage(ProductManage dto, String uploadPath) throws Exception {
		for(MultipartFile mf : dto.getPppFile()) {
			try {
				String ppp = Objects.requireNonNull(storageSerivce.uploadFileToServer(mf, uploadPath)); //서버에서 저장된 파일경로
				
				dto.setPpp(ppp);
				mapper.insertProductImage(dto);
				
			} catch (NullPointerException e) {
				log.info("insertProductImage1 : " , e);
			} catch (StorageException e) {
				log.info("insertProductImage2 : " , e);
			} catch (Exception e) {
				throw e;
			}
		}
	}
	
	@Override
	public void insertTogetherProduct(ProductManage dto) throws Exception {
		try {
			
			String startStr = dto.getPtsd();
			String endStr = dto.getPted();
			
			LocalDate start = LocalDate.parse(startStr, DateTimeFormatter.ISO_LOCAL_DATE);
			LocalDate end = LocalDate.parse(endStr, DateTimeFormatter.ISO_LOCAL_DATE);				
			LocalDate today = LocalDate.now();
			
			int target = dto.getPtq(); //상품수량
			int sold = 0; //d 어케가져올지 미정
			
			if(today.isBefore(start)) {
				dto.setStatus("진행전");
			} else if(! today.isAfter(end)) {
				dto.setStatus("진행중");
			} else {
				if(sold < target) {
					dto.setStatus("구매실패");
				} else {
					dto.setStatus("구매성공");
				}
			}
			
			mapper.insertTogetherProduct(dto);
		} catch (Exception e) {
			log.info("insertTogetherProduct : " , e);
			throw e;
		}
		
	}
	@Override
	public void updateTogetherProduct(ProductManage dto) throws Exception {
		try {
			mapper.updateTogetherProduct(dto);
		} catch (Exception e) {
			log.info("updateTogetherProduct : ", e);
			throw e;
		}
	}
	
	@Override
	public void deleteTogetherProduct(long pnum) throws Exception {
		try {
			ProductManage dto = findByPnum(pnum);
			if(dto == null){
				return;
			}
			mapper.deleteTogetherProduct(pnum);
		} catch (Exception e) {
			log.info("deleteTogetherProduct : ", e);
		}
	}

	@Override
	public List<ProductManage> listProduct(Map<String, Object> map) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listProduct(map);
			
			
		} catch (Exception e) {
			log.info("listProduct : ", e);
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);			
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}
		
		return result;
	}

	@Override
	public List<ProductManage> listTogetherProduct(Map<String, Object> map) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listTogetherProduct(map);
			/*
			for(ProductManage dto : list) {
				String startStr = dto.getPtsd();
				String endStr = dto.getPted();
				
				LocalDate start = LocalDate.parse(startStr, DateTimeFormatter.ISO_LOCAL_DATE);
				LocalDate end = LocalDate.parse(endStr, DateTimeFormatter.ISO_LOCAL_DATE);				
				LocalDate today = LocalDate.now();
				
				int target = dto.getPtq(); //상품수량
				int sold = 0; //d 어케가져올지 미정
				
				if(today.isBefore(start)) {
					dto.setStatus("진행전");
				} else if(! today.isAfter(end)) {
					dto.setStatus("진행중");
				} else {
					if(sold < target) {
						dto.setStatus("구매실패");
					} else {
						dto.setStatus("판매완료");
					}
				}
			}
			*/
			
		} catch (Exception e) {
			log.info("listTogetherProduct : ", e);
		}
		
		return list;
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
			
			
			
		} catch (Exception e) {
			log.info("dataCount2 : ", e);
		}
		return result;
	}

	@Override
	public ProductManage findByPnum(long pnum) {
		ProductManage dto = null;
		
		try {
			dto = mapper.findByPnum(pnum);
		} catch (Exception e) {
			log.info("findByPnum : ", e);
		}
		
		return dto;
	}



	
	
	
	
	
	
	
	
	
}
