package com.sp.app.lounge.service;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.MyUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.mapper.PhotoBoardMapper;
import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.model.PhotoReply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PhotoBoardServiceImpl implements PhotoBoardService{
	private final PhotoBoardMapper mapper;
	private final StorageService storageService;
	private final MyUtil myUtil;
	
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
		List<PhotoBoard> list = null;

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
			log.info("dataCount : ", e);
		}

		return result;
	}

	@Override
	public PhotoBoard findById(Map<String, Object> map) {
		PhotoBoard dto = null;
		
		try {
			dto = mapper.findById(map);
			
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			log.info("updateHitCount : ", e);
			
		}
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
	public void deleteBoard(long num, String uploadPath, String userId, int userLevel) throws Exception {
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("psnum", num);
			deleteFile(map);
			
			PhotoBoard dto = findById(map);
			
			if(dto == null || (userLevel<51 && ! dto.getNickname().equals(userId))) {
				return;
			}
			
			deleteUploadFile(uploadPath, dto.getSsfname());
			
			mapper.deleteBoard(num);
			
		} catch (Exception e) {
			log.info("deleteBoard : ", e);
			
			throw e;
		}
	}
	
	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return storageService.deleteFile(uploadPath, filename);

	}
	
	@Override
	public void BoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean MemberBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void Reply(PhotoReply dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PhotoReply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PhotoBoard> listFile(long num) {
		List<PhotoBoard> listFile =  null;
		
		try {
			listFile = mapper.listFile(num);
		} catch (Exception e) {
			log.info("listFile : ", e);
		}
		return listFile;
	}

	@Override
	public PhotoBoard findByFileId(long fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFile(PhotoBoard dto) throws SQLException {
		// TODO Auto-generated method stub
		
	}


}