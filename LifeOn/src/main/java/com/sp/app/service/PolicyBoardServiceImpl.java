package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.common.MyUtil;
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
	private final MyUtil myUtil;
	
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

	@Override
	public List<PolicyBoard> listPolicy(Map<String, Object> map) {
		List<PolicyBoard> list = null;
		
		try {
			list = mapper.listPolicy(map);
			
		} catch (Exception e) {
			log.info("listBoard : ", e);
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
			
		} catch (Exception e) {
			log.info("dataCount: " , e);
		}
		return result;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
			
		} catch (Exception e) {
			log.info("updateHitCount : ", e);
			throw e;
			
		}
		
	}

	@Override
	public PolicyBoard findById(long num) throws Exception {
		PolicyBoard dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById: ", e);
		}
		return dto;
	}
	
}
