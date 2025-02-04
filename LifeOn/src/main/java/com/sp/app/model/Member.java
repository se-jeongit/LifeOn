package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Member {
	
	//회원테이블
	private long num;
	private String id;
	private String pwd;
	private String nickName;
	private int block;
	private String reg_date;
	private String mod_date;
	private String last_login; //마지막접속때문에 추가 디비엔 아직 반영안함. 세션정보로 처리할수도 있을거 같아서 
	private int grade;
	private int enabled;
	
	//회원상세테이블
	private String name;
	private String gender;
	private String birth;
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String addr1;
	private String addr2;
	private int post;
}
