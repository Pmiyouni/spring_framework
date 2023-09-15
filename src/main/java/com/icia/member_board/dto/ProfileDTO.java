package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfileDTO {
    private Long id;
    private Long pId;
    private String OriginalFileName;
    private String StoredFileName;
}
