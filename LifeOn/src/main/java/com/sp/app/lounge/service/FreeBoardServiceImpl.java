package com.sp.app.lounge.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.MyUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.mapper.FreeBoardMapper;
import com.sp.app.lounge.model.FreeBoard;
import com.sp.app.lounge.model.FreeReply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {
	private final FreeBoardMapper mapper;
	private final StorageService storageService;
	private final MyUtil myUtil;

	@Override
	public void insertBoard(FreeBoard dto, String uploadPath) throws Exception {
		try {
			if (! dto.getSelectFile().isEmpty()) {
				String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				String originalFilename = dto.getSelectFile().getOriginalFilename();
				
				dto.setSsfname(saveFilename);
				dto.setCpfname(originalFilename);
			}
			
			mapper.insertBoard(dto);
			
		} catch (Exception e) {
			log.info("insertBoard : " + e);
			
			throw e;
		}
	}

	@Override
	public List<FreeBoard> listBoard(Map<String, Object> map) {
		List<FreeBoard> list = null;

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
	public FreeBoard findById(long num) {
		FreeBoard dto = null;

		try {
			dto = mapper.findById(num);
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
			
			throw e;
		}
	}

	@Override
	public FreeBoard findByPrev(Map<String, Object> map) {
		FreeBoard dto = null;
		
		try {
			// dto = mapper.findByPrev(map);
		} catch (Exception e) {
			log.info("findByPrev : ", e);
		}
		
		return dto;
	}

	@Override
	public FreeBoard findByNext(Map<String, Object> map) {
		FreeBoard dto = null;
		
		try {
			// dto = mapper.findByNext(map);
		} catch (Exception e) {
			log.info("findByNext : ", e);
		}
		
		return dto;
	}

	@Override
	public void updateBoard(FreeBoard dto, String uploadPath) throws Exception {
		try {
			if (dto.getSelectFile() != null && ! dto.getSelectFile().isEmpty()) {
				if (! dto.getSsfname().isBlank()) {
					deleteUploadFile(uploadPath, dto.getSsfname());
				}
				
				String savaFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				dto.setSsfname(savaFilename);
				dto.setCpfname(dto.getSelectFile().getOriginalFilename());
			}
			
			mapper.updateBoard(dto);
			
		} catch (Exception e) {
			log.info("updateBoard : ", e);
			
			throw e;
		}
	}

	@Override
	public void deleteBoard(long num, String uploadPath, String id, int grade) throws Exception {
		try {
			FreeBoard dto = findById(num);
			
			if (dto == null || (grade < 51 && ! dto.getId().equals(id))) {
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
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertBoardLike(map);
		} catch (Exception e) {
			log.info("insertBoardLike : ", e);
			
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
	public int boardLikeCount(long num) {
		int result = 0;
		try {
			result = mapper.boardLikeCount(num);
		} catch (Exception e) {
			log.info("boardLikeCount : ", e);
		}
		
		return result;
	}

	@Override
	public boolean isMemberBoardLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			FreeBoard dto = mapper.memberBoardLiked(map);
			if (dto != null) {
				result = true;
			}
		} catch (Exception e) {
			log.info("isMemberBoardLiked : ", e);
		}
		
		return result;
	}

	@Override
	public void insertReply(FreeReply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			log.info("insertReply : ", e);
			
			throw e;
		}
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			log.info("replyCount : ", e);
		}
		
		return result;
	}

	@Override
	public List<FreeReply> listReply(Map<String, Object> map) {
		List<FreeReply> list = null;
		
		try {
			list = mapper.listReply(map);
			
			for (FreeReply dto : list) {
				dto.setRpcontent(myUtil.htmlSymbols(dto.getRpcontent()));
				
				map.put("rpnum", dto.getRpnum());
				dto.setMemberLiked(memberReplyLiked(map));
			}
			
		} catch (Exception e) {
			log.info("listReply : ", e);
		}
		
		return list;
	}
	
	protected int memberReplyLiked(Map<String, Object> map) {
		int result = -1;
		
		try {
			result = mapper.memberReplyLiked(map).orElse(-1);
		} catch (Exception e) {
			log.info("userReplyLiked : ", e);
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			log.info("deleteReply : ", e);
			
			throw e;
		}
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertReplyLike(map);
		} catch (Exception e) {
			log.info("insertReplyLike : ", e);
			
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = mapper.replyLikeCount(map);
		} catch (Exception e) {
			log.info("replyLikeCount : ", e);
		}
		return countMap;
	}
}
