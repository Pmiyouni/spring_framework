package com.icia.member_board.controller;

import com.icia.member_board.dto.FavoriteDTO;
import com.icia.member_board.dto.MemberDTO;
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

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;


    @GetMapping("/insert")
    public ResponseEntity insert(@RequestParam("fid") Long fid,
                                 @RequestParam("uid") Long uid) {
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setFid(fid);
        favoriteDTO.setUid(uid);
        favoriteService.insert(favoriteDTO);
        favoriteDTO.setFcnt(favoriteService.fcount(favoriteDTO));
        favoriteDTO.setCkcnt( favoriteService.ckcount(favoriteDTO));
        System.out.println("favoriteDTO = " + favoriteDTO);
         return new ResponseEntity<>(favoriteDTO, HttpStatus.OK);

        }

    @GetMapping("/delete")
    public ResponseEntity delete(@RequestParam("fid") Long fid,
                                 @RequestParam("uid") Long uid) {
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setFid(fid);
        favoriteDTO.setUid(uid);
        favoriteService.delete(favoriteDTO);
        favoriteDTO.setFcnt(favoriteService.fcount(favoriteDTO));
        favoriteDTO.setCkcnt( favoriteService.ckcount(favoriteDTO));
        System.out.println("favoriteDTO = " + favoriteDTO);
        return new ResponseEntity<>(favoriteDTO, HttpStatus.OK);

    }
    }

