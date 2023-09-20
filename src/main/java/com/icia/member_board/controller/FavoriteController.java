package com.icia.member_board.controller;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.FavoriteDTO;
import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.dto.NotfavoriteDTO;
import com.icia.member_board.service.BoardService;
import com.icia.member_board.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    private BoardService boardService;


    @GetMapping("/like")
    
    public ResponseEntity insert(@RequestParam("fid") Long fid,
                         HttpSession session) {
        String upass = (String)session.getAttribute("loginEmail");
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setFid(fid);
        favoriteDTO.setUpass(upass);
        int ckcnt= favoriteService.ckcount(favoriteDTO);
        if(ckcnt == 0) {
            favoriteService.insert(favoriteDTO);
        }
        favoriteDTO.setFcnt(favoriteService.fcount(favoriteDTO));
        favoriteDTO.setCkcnt( favoriteService.ckcount(favoriteDTO));
        return new ResponseEntity<>(favoriteDTO, HttpStatus.OK);
        }

    @GetMapping("/notlike")
    public ResponseEntity insert2(@RequestParam("nid") Long nid,
                                 HttpSession session) {
        String npass = (String)session.getAttribute("loginEmail");
        NotfavoriteDTO notfavoriteDTO = new NotfavoriteDTO();
        notfavoriteDTO.setNid(nid);
        notfavoriteDTO.setNpass(npass);
        int ckcnt2=favoriteService.ckcount2(notfavoriteDTO);
        if(ckcnt2 == 0) {
            favoriteService.insert2(notfavoriteDTO);
        }
        notfavoriteDTO.setNcnt(favoriteService.ncount(notfavoriteDTO));
        notfavoriteDTO.setCkcnt2( favoriteService.ckcount2(notfavoriteDTO));
        return new ResponseEntity<>(notfavoriteDTO, HttpStatus.OK);
    }

    }

