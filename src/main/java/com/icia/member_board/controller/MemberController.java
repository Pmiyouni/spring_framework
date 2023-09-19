package com.icia.member_board.controller;

import com.icia.member_board.dto.MemberDTO;
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
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        System.out.println("memberDTO = " + memberDTO);
        return "redirect:/member/login";
    }

    //이메일 중복 체크
    @PostMapping("/duplicate-check")
    public ResponseEntity duplicateCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK); // http status code 200
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT); //409, 충돌
        }
        // 'ResponseEntity'는 HTTP 응답을 처리하기 위해 Spring Framework에서 제공하는 클래스
        //특정 상태 코드가 포함된 HTTP 응답을 보내려는 경우 일반적으로 응답 정보를 캡슐화하기 위해 새로운 `ResponseEntity` 객체를 생성
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
            // 로그인 성공시 사용자의 이메일을 세션에 저장
            session.setAttribute("loginEmail", membersaveDTO.getMemberEmail());
            session.setAttribute("memberId", membersaveDTO.getId());
            // model.addAttribute("member", memberDTO); // x
            // 모델에 이메일 저장
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
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        System.out.println("findall memberDTOList = " + memberDTOList);
        model.addAttribute("memberList", memberDTOList);
        return "memberList";
    }

    @GetMapping("/member")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "memberDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        boardService.boardDelete(id);
        commentService.commentDelete(id);
        return "redirect:/member/members";
    }
    @GetMapping("/remove")
    public String remove(@RequestParam("id") Long id) {
        System.out.println("remove");
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
