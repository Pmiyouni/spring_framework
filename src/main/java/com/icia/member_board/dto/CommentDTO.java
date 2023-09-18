package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    private  Long boardId;
    private String commentWriter;
    private String commentContents;
    private String createdAt;
    private Long cid;
}