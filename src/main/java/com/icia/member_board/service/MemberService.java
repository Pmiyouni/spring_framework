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
}
