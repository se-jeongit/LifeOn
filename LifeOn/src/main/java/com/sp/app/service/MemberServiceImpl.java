package com.sp.app.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.mapper.MemberMapper;
import com.sp.app.model.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{
	private final MemberMapper mapper;
	
	@Override
	public Member loginMember(String id) {
		Member dto = null;
		
		try {
			dto = mapper.loginMember(id);
		} catch (Exception e) {
			log.info("loginMember : " , e );
		}
		
		return dto;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			mapper.insertMember(dto);
			mapper.insertMemberDetail(dto);
			
		} catch (Exception e) {
			log.info("insertMember : " , e);
			throw e;
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
