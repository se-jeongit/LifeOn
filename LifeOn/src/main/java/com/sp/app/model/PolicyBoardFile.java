package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PolicyBoardFile {
	    private long fnum; // 파일 고유 ID (pk)
	    private long psnum; // 게시글 번호 (policy_board 테이블과 연결) (fk) 
	    private String ssfname; // 저장된 파일 경로
	    private String cpfname; // 원본 파일명

}
	

