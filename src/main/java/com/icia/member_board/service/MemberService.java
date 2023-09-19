package com.icia.member_board.service;

import com.icia.member_board.dto.*;
import com.icia.member_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {

        if (memberDTO.getMemberProfile().isEmpty()) {
            memberDTO.setFileAttached(0);
             memberRepository.save(memberDTO);
             System.out.println("memberDTO = " + memberDTO);
        } else {
            memberDTO.setFileAttached(1);
            MemberDTO saveMember= memberRepository.save(memberDTO);
            //for (MultipartFile profileFile : memberDTO.getMemberProfile()) {
                 MultipartFile profileFile = memberDTO.getMemberProfile();

                String originalFilename = profileFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);

                System.out.println(System.currentTimeMillis());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);

                ProfileDTO profileDTO = new ProfileDTO();
                profileDTO.setOriginalFileName(originalFilename);
                profileDTO.setStoredFileName(storedFileName);
                profileDTO.setPid(saveMember.getId());

                String savePath = "c:\\spring_pro_img\\" + storedFileName;
                profileFile.transferTo(new File(savePath));

                memberRepository.saveFile(profileDTO);
           // }
        }
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {

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
    public PageDTO pageNumber(int page) {
        int pageLimit = 5; // 한페이지에 보여줄 글 갯수
        int blockLimit = 3; // 하단에 보여줄 페이지 번호 갯수
        // 전체 글 갯수 조회
        int memberCount = memberRepository.memberCount();
        int maxPage = (int) (Math.ceil((double)memberCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }

    public List<MemberDTO> pagingList(int page) {
        int pageLimit = 5; // 한페이지당 보여줄 글 갯수
        int pagingStart = (page - 1) * pageLimit; // 요청한 페이지에 보여줄 첫번째 게시글의 순서
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        return memberRepository.pagingList(pagingParams);
    }

    public List<MemberDTO> searchList(String q, String type, int page) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam.put("q", q);
        searchParam.put("type", type);
        int pageLimit = 5;
        int pagingStart = (page - 1) * pageLimit;
        searchParam.put("start", pagingStart);
        searchParam.put("limit", pageLimit);
        return memberRepository.searchList(searchParam);
    }

    public PageDTO searchPageNumber(String q, String type, int page) {
        int pageLimit = 5; // 한페이지에 보여줄 글 갯수
        int blockLimit = 3; // 하단에 보여줄 페이지 번호 갯수
        Map<String, String> pagingParams = new HashMap<>();
        pagingParams.put("q", q);
        pagingParams.put("type", type);
        // 검색어 기준 글 갯수 조회
        int memberCount = memberRepository.memberSearchCount(pagingParams);
        // 검색어 기준 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double)memberCount / pageLimit));
        // 검색어 기준 시작 페이지 값 계산
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 검색어 기준 마지막 페이지 값 계산
        int endPage = startPage + blockLimit - 1;
        // 검색어 기준 전체 페이지 갯수가 계산한 endPage 보다 작을 때는 endPage 값을 maxPage 값과 같게 세팅
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }
}
