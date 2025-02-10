package com.sp.app.lounge.model;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FreeBoard {
    private long psnum; // 글번호
    private String num; // 회원번호
    private String nickname; // 회원닉네임
    private String subject; // 글제목
    private String content; // 글내용
    private String reg_date; // 글등록일
    private String uddate; // 글수정일
    
    private int blind; // 0: Default, 1: 블라인드처리
    private int hitCount; // 조회수
    
    private int replyCount; // 댓글갯수 HYBRID_BOARD_REPLY
    private int boardLikeCount; // 즐겨찾기개수 HYBRID_BOARD_FAV
	
    // 파일
    private long fnum; // 파일번호
	private String ssfname; // 서버에 저장된 파일명
	private String cpfname; // 클라이언트가 올린 파일명(원본파일명)
	private MultipartFile selectFile;
	
	// 댓글
	private long rpnum; // 댓글번호
	private String rpcontent; // 댓글내용
	private String rpreg_date; // 댓글등록일
	private int rpblind; // 0: Default, 1: 블라인드처리
	
	private int likeCount; // 댓글좋아요 HYBRID_BOARD_LIKE
	
	@Value("-1") // 초기값
	private int memberLiked;
}
