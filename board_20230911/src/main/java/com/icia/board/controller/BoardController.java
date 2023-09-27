package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.CommentDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;
import com.icia.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
@Controller
@RequestMapping("/board") //주요 경로를 미리 셋팅함
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;


    // 등록화면 출력
    @GetMapping("/save")
    public String saveForm() {
        return "boardSave";
    }

    //등록
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
         boardService.save(boardDTO);
        return "redirect:/board/list";
    }

    //목록 출력
    @GetMapping("/list")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          Model model) {

            List<BoardDTO> boardDTOList = boardService.pagingList(page);
            System.out.println("boardDTOList = " + boardDTOList);
            model.addAttribute("boardList", boardDTOList);

            PageDTO pageDTO = boardService.pageNumber(page);
            model.addAttribute("paging", pageDTO);
        return "boardList";
    }

    @GetMapping("/search")
    public String search(@RequestParam("q") String q,
                         @RequestParam("type") String type,
                         Model model) {
        List<BoardDTO> boardDTOList = boardService.searchList(q, type);
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/boardList";
    }

    //조회
    @GetMapping
    public String findById(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model) {
        // 조회수 처리
        // 데이터 가져오기
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTOList);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        model.addAttribute("page", page);
        return "boardDetail";
    }

    //수정화면
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardUpdate";
    }

    //수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO boardDTO1 = boardService.findById(boardDTO.getId());
        model.addAttribute("board", boardDTO1);
        return "boardDetail";
        //return  "redirect:/board?id="+boardDTO.getID();
        //이렇게 해도 동일처리이나 수정이었음에도 조회수를 1 증가시킴으로 좋은 방법은 아님
    }

    //삭제 화면
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/list";
    }
        @GetMapping("/sample")
        public String sampleData() {
            for (int i = 1; i <= 20; i++) {
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setBoardWriter("aa");
                boardDTO.setBoardTitle("title" + i);
                boardDTO.setBoardContents("contents" + i);
                boardDTO.setBoardPass("pass" + i);
                boardService.sampleData(boardDTO);
            }
            return "redirect:/board/list";
        }
    }


//    @GetMapping("/delete")
//    public String delete(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.findById(id);
//        //System.out.println("boardDTO = " + boardDTO);
//        model.addAttribute("board", boardDTO);
//        return "deleteCheck";
//    }
//
//    //삭제처리
//    @PostMapping("/delete")
//    public String deleteCheck(@ModelAttribute BoardDTO boardDTO, Model model) {
//        System.out.println("boardDTO = " + boardDTO);
//        boardService.delete(boardDTO.getId());
//        return "redirect:/board/";
//    }







