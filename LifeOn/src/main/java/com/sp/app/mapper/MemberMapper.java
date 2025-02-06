package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String id);
	
	public void updateLastLogin(String id) throws SQLException;
	
	public void insertMember(Member dto) throws SQLException;
	public void insertMemberDetail(Member dto) throws SQLException;
	
	//public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
	
	//public void updateMemberGrade(Map<String, Object> map) throws SQLException;
	
	public void updateMember(Member dto) throws SQLException;
	public void updateMemberDetail(Member dto) throws SQLException;
	
	public Member findById(String id);
	
	public void deleteMember(Map<String, Object> map) throws SQLException;
	public void deleteMemberDetail(Map<String, Object> map) throws SQLException;

}
