package com.sp.app.lounge.model;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PhotoReply {
	private long rpnum; 
	private String rpcontent; 
	private String rpreg_date; 
	private int rpblind; // 0: Default, 1: 블라인드처리
	
	private int replyLike; 
	
	@Value("-1") 
	private int memberLiked;
}
