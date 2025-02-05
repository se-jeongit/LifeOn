package com.sp.app.service;

import com.sp.app.model.Member;

public interface MemberService {
	public Member loginMember(String id);
	
	public void insertMember(Member dto) throws Exception;
}
