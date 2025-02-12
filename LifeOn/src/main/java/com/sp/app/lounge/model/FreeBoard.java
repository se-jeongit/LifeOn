package com.sp.app.lounge.model;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FreeBoard {
    private long psnum; // 글번호
    private long num; // 회원번호
    private String id; // 회원아이디
    private String nickname; // 회원닉네임
    private String subject; // 글제목
    private String content; // 글내용
    private String reg_date; // 글등록일
    private String uddate; // 글수정일
    private String ipaddr; // ip주소
    private String bdtype; // 게시판 카테고리(생활팁) HYBRID_BOARD
    // 자유게시판은 별도로 데이터 관리 FREE_BOARD
    
    private int blind; // 0: Default, 1: 블라인드처리
    private int hitCount; // 조회수
    
    // 댓글갯수 FREE_BOARD_REPLY, HYBRID_BOARD_REPLY
    private int replyCount;
    // 즐겨찾기개수 FREE_BOARD_FAV, HYBRID_BOARD_FAV
    private int boardLikeCount;
	
    // 파일 FREE_BOARD_FILE, HYBRID_FILE
    private long fnum; // 파일번호
	private String ssfname; // 서버에 저장된 파일명
	private String cpfname; // 클라이언트가 올린 파일명(원본파일명)
	private MultipartFile selectFile;
}
