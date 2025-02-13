package com.sp.app.lounge.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PhotoBoard {
	private long psnum;
    private String num;
	private String subject;
	private String content;
	private String ipaddr;
	private String bdtype;
	private String reg_date;
	private int blind;
	private int hitCount;
	private int boardLikeCount;
	
	private long fnum;
	private String ssfname; // 서버 저장 파일명
	private String cpfname; // 클라이언트가 올린 파일
	private MultipartFile selectFile;
	
	private long rpnum;
	private String rpcontent;
	private String rpreg_date;
	private int replyCount;
	private int likeCount;
	private int rpblind;
	// 
}
