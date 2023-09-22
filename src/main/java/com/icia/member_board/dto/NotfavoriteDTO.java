package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NotfavoriteDTO {
    private Long id;
    private Long nid; //게시판번호
    private String npass; //회원번호
    private int ncnt; //싫어요수
    private int ckcnt2; //사용자 싫어요 체크여부


}
