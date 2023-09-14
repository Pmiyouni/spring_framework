package com.icia.member_board.service;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.BoardFileDTO;
import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }
    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

    public boolean login(MemberDTO memberDTO) {
         /*
            1. 이메일, 비밀번호 두 값 모두 일치하는 db 조회결과를 가져옴(조회결과 있으면 로그인 성공)
            2. 이메일로 DB에서 조회해서 서비스에서 비밀번호를 서로 비교하여 일치하면 로그인 성공
         */
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

}
