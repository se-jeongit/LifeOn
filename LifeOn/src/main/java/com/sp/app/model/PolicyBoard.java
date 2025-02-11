package com.sp.app.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PolicyBoard {

	private long psnum;
	private long num; 
	private String subject;
	private String content;
	private String reg_date;
	private int hitcount;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile; // <input type='file' name='selectFile' ..
	
	private String nickname;
	private String cpfname;
}
