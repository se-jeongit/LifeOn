package com.sp.app.service;

import java.util.Map;
import java.util.Objects;

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
	
	
	@Override
	public void updateLastLogin(String id) throws Exception {
		try {
			mapper.updateLastLogin(id);
		} catch (Exception e) {
			log.info("updateLastLogin : ", e);
			throw e;
		}
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

	@Override
	public Member findById(String id) {
		Member dto = null;
		
		try {
			// 객체 = Objects.requireNonNull(객체)
			//  : 파라미터로 입력된 값이 null 이면 NullPointerException을 발생하고,
			//    그렇지 않다면 입력값을 그대로 반환
			dto = Objects.requireNonNull(mapper.findById(id));			
			
		} catch (NullPointerException e) {
		} catch (ArrayIndexOutOfBoundsException e) {
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		
		return dto;
	}
	
	
	@Override
	public Member findByNickName(String nickName) {
		Member dto = null;
		
		try {
			dto = Objects.requireNonNull(mapper.findByNickName(nickName));
		
		} catch (NullPointerException e) {
		} catch (ArrayIndexOutOfBoundsException e) {
		} catch (Exception e) {
			log.info("findByNickName : ", e);
		}
		
		
		return dto;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			mapper.updateMember(dto);
			mapper.updateMemberDetail(dto);
		} catch (Exception e) {
			log.info("updateMember : ", e);
			
			throw e;
		}
		
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteMemberDetail(map);
			mapper.deleteMember(map);
		} catch (Exception e) {
			log.info("deleteMember : ", e);
			throw e;
		}
	}




	
	
	
	
	
	
	
	
	
	
	
	
	
}
