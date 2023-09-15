package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

    @Getter
    @Setter
    @ToString
    public class BoardFileDTO {
        private Long id;
        private Long aId;
        private String originalFileName;
        private String storedFileName;
    }

