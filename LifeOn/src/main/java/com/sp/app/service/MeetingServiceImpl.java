package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.MeetingMapper;
import com.sp.app.model.Meeting;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetingServiceImpl implements MeetingService{
	private final MeetingMapper mapper;
	private final StorageService storageService;
	
	@Override
	public void insertBoard(Meeting dto) throws Exception {
		try {
			long seq = mapper.meetingSeq();
			dto.setPsnum(seq);
			
			mapper.insertBoard(dto);

		} catch (Exception e) {
			log.info("insertBoard : ", e);
			
			throw e;
		}
	}
	@Override
	public List<Meeting> listCategory() {
		List<Meeting> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			log.info("listCategory : ", e);
		}
		return list;
	}
	
	@Override
	public Meeting findByCategory(long categoryNum) {
		 Meeting dto = null;
		
		try {
			dto = mapper.findByCategory(categoryNum);
		} catch (Exception e) {
			log.info("findByCategory : ", e);
		}
		
		return dto;
	}
	
	@Override
	public void updateBoard(Meeting dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteBoard(String bdtype, long psnum, String nickname, int grade) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Meeting> listBoard(Map<String, Object> map) {
		List<Meeting> list = null;

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
	public Meeting findById(long num) {
		Meeting dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById : ", e);
		}

		return dto;
	}
	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void boardLike(Map<String, Object> map) throws Exception {
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
	public boolean memberBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void reply(Meeting dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Meeting> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void replyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
	
	