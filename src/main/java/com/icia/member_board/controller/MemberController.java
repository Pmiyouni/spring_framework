package com.icia.member_board.controller;

import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
//@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/member/save")
    public String saveForm() {
        return "memberSave";
    }

    @PostMapping("/member/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
       return "redirect:/member/list";
    }
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
    @GetMapping("/member/login")
    public String loginForm() {
        return "memberLogin";
    }

    @PostMapping("/member/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            // 로그인 성공시 사용자의 이메일을 세션에 저장
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            // model.addAttribute("member", memberDTO); // x
            // 모델에 이메일 저장
            model.addAttribute("email", memberDTO.getMemberEmail());
            return "boardList";
        } else {
            return "memberLogin";
        }
    }

    @GetMapping("/member/logout")
    public String logout(HttpSession session) {
        // 아래 방법 중 한가지만 사용
        // 해당 파라미터만 없앨 경우
        session.removeAttribute("loginEmail");
        // 세션 전체를 없앨 경우
//        session.invalidate();
        return "redirect:/";
    }


}
