package com.sp.app.service;

import org.springframework.stereotype.Service;

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

}
