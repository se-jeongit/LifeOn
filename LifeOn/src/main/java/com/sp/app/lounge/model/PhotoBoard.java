package com.sp.app.lounge.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PhotoBoard {
	private long psnum; // 글번호
    private long num; // 회원번호
    private String id; 
    private String nickname; 
	private String subject;
	private String content;
	private String ipaddr;
	private String bdtype;
	private String reg_date;
	private int blind;
	private int hitCount;
	private int boardLikeCount;
	private int replyCount;
	
	private long fnum;
	private String ssfname; // 서버 저장 파일명
	private String cpfname; // 클라이언트가 올린 파일
	private MultipartFile selectFile;
	
}
