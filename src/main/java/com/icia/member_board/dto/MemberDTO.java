package com.icia.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Setter
@Getter
@ToString
public class MemberDTO {
    private Long mId;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;
    private MultipartFile  memberProfile;
}
