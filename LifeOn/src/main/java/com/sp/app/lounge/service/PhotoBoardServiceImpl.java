package com.sp.app.lounge.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.lounge.mapper.PhotoBoardMapper;
import com.sp.app.lounge.model.PhotoBoard;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PhotoBoardServiceImpl implements PhotoBoardService{
	private final PhotoBoardMapper mapper;
	private final StorageService storageService;
	
	@Override
	public void insertBoard(PhotoBoard dto, String uploadPath) throws Exception {
		try {
			if(! dto.getSelectFile().isEmpty()) {
				String saveFilename = 
						storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				String originalFilename = 
						dto.getSelectFile().getOriginalFilename();
				
				dto.setSsfname(saveFilename);
				dto.setCpfname(originalFilename);
			}
			
			mapper.insertBoard(dto);
			
		} catch (Exception e) {
			log.info("insertBoard : ", e);
			
			throw e;
		}
	}

	@Override
	public List<PhotoBoard> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PhotoBoard findById(long psnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long cpfname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PhotoBoard findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhotoBoard findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(PhotoBoard dto, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(long psnum, String uploadPath, String userId, int userLevel) throws Exception {
		// TODO Auto-generated method stub
		
	}

}