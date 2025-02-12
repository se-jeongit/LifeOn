package com.sp.app.lounge.model;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FreeReply {
	// FREE_BOARD_REPLY, HYBRID_BOARD_REPLY
	private long rpnum; // 댓글번호
	private String rpcontent; // 댓글내용
	private String rpreg_date; // 댓글등록일
	private int rpblind; // 0: Default, 1: 블라인드처리
	
	private int likeCount; // 댓글좋아요 FREE_BOARD_LIKE, HYBRID_BOARD_LIKE
	
	@Value("-1") // 초기값
	private int memberLiked;
}
