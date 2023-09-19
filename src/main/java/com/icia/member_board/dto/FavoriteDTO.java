package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FavoriteDTO {
    private Long fid; //게시판번호
    private Long uid; //회원번호
    private String createdAt; //작성일시
    private int fcnt; //좋아요수
    private int ckcnt; //사용자 좋아요 체크여부


}
