package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.PolicyBoardMapper;

import com.sp.app.model.PolicyBoard;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PolicyBoardServiceImpl implements PolicyBoardService {
	private final PolicyBoardMapper mapper;
	private final StorageService storageService;

	@Override
	public void insertBoard(PolicyBoard dto, String uploadPath) throws Exception {
		try {
			if (!dto.getSelectFile().isEmpty()) {
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

	@Override
	public List<PolicyBoard> listBoard(Map<String, Object> map) {
		List<PolicyBoard> list = null;

		try {
			list = mapper.listBoard(map);

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
			log.info("dataCount: ", e);
		}
		return result;
	}

	@Override
	public PolicyBoard findById(long num) {
		PolicyBoard dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById: ", e);
		}

		return dto;
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
	public PolicyBoard findByPrev(Map<String, Object> map) {
		PolicyBoard dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			log.info("findByPrev : ", e);
		}
		return dto;
	}

	@Override
	public PolicyBoard findByNext(Map<String, Object> map) {
		PolicyBoard dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			log.info("findByNext : ", e);
		}
		return dto;
	}

	@Override
	public void updateBoard(PolicyBoard dto, String uploadPath) throws Exception {
		try {
			if(dto.getSelectFile() != null && ! dto.getSelectFile().isEmpty()) {
				//기존 파일 지우기
				if(! dto.getSavefilename().isBlank()) {
					deleteUploadFile(uploadPath, dto.getSavefilename());
				}
				
				String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				
				dto.setSavefilename(saveFilename);
				dto.setOriginalfilename(dto.getSelectFile().getOriginalFilename());
			}
			
			mapper.updateBoard(dto);
		} catch (Exception e) {

		}
	}

	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		
		return storageService.deleteFile(uploadPath, filename);
	}

	@Override
	public void deleteBoard(long num, String uploadPath, String id, int grade) throws Exception {
		try {
			PolicyBoard dto = findById(num);
			
			
			deleteUploadFile(uploadPath, dto.getSavefilename());
			
			mapper.deleteBoard(num);
		} catch (Exception e) {
			log.info("deleteBoard : " , e);
			
			throw e; 
		}
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertBoardLike(map);
			
		} catch (Exception e) {
			log.info("insertBoardLike :", e);
			throw e;
		}
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteBoardLike(map);
		} catch (Exception e) {
			log.info("deleteBoardLike : ", e);
			throw e;
		}
	}

	@Override
	public int boardLikeCount(long psnum) {
		int result = 0;
		try {
			result = mapper.boardLikeCount(psnum);
		} catch (Exception e) {
			log.info("boardLikeCount :", e);
		}
		return result;
	}

	@Override
	public boolean isUserBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			PolicyBoard dto = mapper.userBoardLike(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			log.info("isUserBoardLiked : ", e);
		}
		return result;
	}

}
