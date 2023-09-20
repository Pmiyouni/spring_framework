package com.icia.member_board.controller;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.dto.PageDTO;
import com.icia.member_board.dto.ProfileDTO;
import com.icia.member_board.service.BoardService;
import com.icia.member_board.service.CommentService;
import com.icia.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    //회원등록
    @GetMapping("/save")
    public String saveForm() {
        return "memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "redirect:/member/login";
    }

    //이메일 중복 체크
    @PostMapping("/duplicate-check")
    public ResponseEntity duplicateCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT); 
        }

    }

    //로그인
    @GetMapping("/login")
    public String loginForm() {
        return "memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO membersaveDTO = memberService.login(memberDTO);
        if (membersaveDTO != null) {
            session.setAttribute("loginEmail", membersaveDTO.getMemberEmail());
            session.setAttribute("memberId", membersaveDTO.getId());
            model.addAttribute("email", membersaveDTO.getMemberEmail());
            return "redirect:/board/list";
        } else {
            System.out.println("사용자 정보가 없습니다");
            return "memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 아래 방법 중 한가지만 사용
        // 해당 파라미터만 없앨 경우
        session.removeAttribute("loginEmail");
        session.removeAttribute("memberId");
        // 세션 전체를 없앨 경우
//        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/members")
    public String members(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "redirect:/member/list";
    }

    @GetMapping("/list")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "q", required = false, defaultValue = "") String q,
                          @RequestParam(value = "type", required = false, defaultValue = "memberName") String type,
                          Model model) {

        List<MemberDTO> memberDTOList = null;
        PageDTO pageDTO = null;

        if(q.equals("")) {
            memberDTOList = memberService.pagingList(page);
            pageDTO =memberService.pageNumber(page);
        } else {
            memberDTOList = memberService.searchList(q, type, page);
            pageDTO = memberService.searchPageNumber(q, type, page);
        }
        model.addAttribute("memberList", memberDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        return "memberList";
    }

    @GetMapping("/member")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "memberDetail";
    }

    //삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        boardService.boardDelete(id);
        commentService.commentDelete(id);
        return "redirect:/member/members";
    }

   //회원탈퇴
    @GetMapping("/remove")
    public String remove(@RequestParam("id") Long id) {
        memberService.remove(id);
        boardService.boardDelete(id);
        commentService.commentDelete(id);
        return "redirect:/member/logout";
    }

    @GetMapping("/mypage")
    public String updateForm(HttpSession session, Model model) {
        // 세션에 저장된 이메일 꺼내기
        String memberEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(memberEmail);
        model.addAttribute("member", memberDTO);
        return "memberUpdate";
    }

    @PostMapping("/mypage")
    public String update(@ModelAttribute MemberDTO memberDTO, Model model) {
        model.addAttribute("member", memberDTO);
        if (memberDTO.getFileAttached() == 1) {
            ProfileDTO profile =memberService.findFile(memberDTO.getId());
            model.addAttribute("profile", profile);
        }
        memberService.update(memberDTO);
        return "memberDetail";
    }
}
