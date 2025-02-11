package com.sp.app.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.PolicyBoardMapper;
import com.sp.app.model.PolicyBoard;
import com.sp.app.model.PolicyBoardFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PolicyBoardServiceImpl implements PolicyBoardService{
	private final StorageService storageService;
	private final PolicyBoardMapper mapper;
	
	@Override
	@Transactional
	public void insertPolicy(PolicyBoard dto, String uploadPath) throws Exception {
		try {
			
			
			if(! dto.getSelectFile().isEmpty()) {
				String saveFilename = 
						storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				String originalFilename = dto.getSelectFile().getOriginalFilename();
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(originalFilename);
			}
			mapper.insertPolicy(dto);
			
			if(dto.getSelectFile() != null && !dto.getSelectFile().isEmpty()) {
				PolicyBoardFile fdto = new PolicyBoardFile();
				
				fdto.setPsnum(dto.getPsnum());
				fdto.setSsfname(dto.getSaveFilename());
				fdto.setCpfname(dto.getOriginalFilename());
				mapper.insertPolicyFile(fdto);
			}
			
		} catch (Exception e) {
			log.info("insertPolicy : ", e);
			throw e;
		}
	}
	
}
