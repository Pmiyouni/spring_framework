package com.icia.member_board.service;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.BoardFileDTO;
import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.dto.ProfileDTO;
import com.icia.member_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;


@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
          /*
            - 파일 있다.
            1. fileAttached=1, board_table에 저장 후 id값 받아오기
            2. 파일원본 이름 가져오기
            3. 저장용 이름 만들기
            4. 파일 저장용 폴더에 파일 저장 처리
            5. board_file_table에 관련 정보 저장

            - 파일 없다.
                fileAttached=0, 나머지는 기존 방식과 동일
         */
        if (memberDTO.getMemberProfile().isEmpty()) {
            // 첨부파일 리스트의 0번째부터 파일 없다.
             //
            memberDTO.setFileAttached(0);
             memberRepository.save(memberDTO);
             System.out.println("memberDTO = " + memberDTO);
        } else {
            // 파일 있다.
            memberDTO.setFileAttached(1);
            // 게시글 저장 후 id값 활용을 위해 리턴 받음.
            MemberDTO saveMember= memberRepository.save(memberDTO); //저장

            //for (MultipartFile profileFile : memberDTO.getMemberProfile()) {
                // 파일만 따로 가져오기
                 MultipartFile profileFile = memberDTO.getMemberProfile();
                // 파일 이름 가져오기
                String originalFilename = profileFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // ProfileDTO 세팅
                ProfileDTO profileDTO = new ProfileDTO();
                profileDTO.setOriginalFileName(originalFilename);
                profileDTO.setStoredFileName(storedFileName);
                profileDTO.setPid(saveMember.getId());//저장하고 dto 받아서
                // 파일 저장용 폴더에 파일 저장 처리
                String savePath = "c:\\spring_pro_img\\" + storedFileName;
                profileFile.transferTo(new File(savePath));
                // board_file_table 저장 처리
                memberRepository.saveFile(profileDTO); //파일 저장
           // }
        }
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
         /*
            1. 이메일, 비밀번호 두 값 모두 일치하는 db 조회결과를 가져옴(조회결과 있으면 로그인 성공)
            2. 이메일로 DB에서 조회해서 서비스에서 비밀번호를 서로 비교하여 일치하면 로그인 성공
         */
        MemberDTO dto = memberRepository.login(memberDTO);
        return dto;
    }
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }
    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }
    public void update(MemberDTO memberDTO) {
       memberRepository.update(memberDTO);
    }
    public ProfileDTO findFile(Long id) {
        return memberRepository.findFile(id);
    }

    public void remove(Long id) {
        memberRepository.remove(id);
    }
}
