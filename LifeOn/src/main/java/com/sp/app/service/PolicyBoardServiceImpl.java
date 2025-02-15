package com.sp.app.service;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.PolicyBoardMapper;
import com.sp.app.model.PolicyBoard;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class PolicyBoardServiceImpl implements PolicyBoardService{
	private final PolicyBoardMapper mapper;
	private final StorageService storageService;
	
	@Override
	public void insertBoard(PolicyBoard dto, String uploadPath) throws Exception {
		try {
			if(! dto.getSelectFile().isEmpty()) {
				String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				String originalFilename = dto.getSelectFile().getOriginalFilename();
				
				
				dto.setSavefilename(saveFilename);
				dto.setOriginalfilename(originalFilename);
			}
			
			mapper.insertBoard(dto);
		} catch (Exception e) {
			log.info("insertBoard :", e);
			throw e;
		}
		
	}
	
	
}
