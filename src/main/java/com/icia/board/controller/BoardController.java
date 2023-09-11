package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.save(boardDTO);
        if (result) {
            return "redirect:/board/";
        } else {
            return "boardSave";
        }
    }
    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardList";
    }

    @GetMapping
    public String  findById(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardDetail";
    }


    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardUpdate";
    }

    //수정을 위한 처리
    @PostMapping("/")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "boardDetail";
    }

    @PostMapping("/delete")
    public String deleteCheck(@ModelAttribute BoardDTO boardDTO, Model model) {
        System.out.println("boardDTO = " + boardDTO);
        boardService.delete(boardDTO.getId());

        return "redirect:/board/";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO=boardService.findById(id);
        System.out.println("boardDTO = " + boardDTO);
        model.addAttribute("board",boardDTO);
        return "deleteCheck";
    }




}

