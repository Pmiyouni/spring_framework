package com.icia.member_board.controller;

import com.icia.member_board.dto.*;
import com.icia.member_board.service.BoardService;
import com.icia.member_board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
        @Autowired
        private BoardService boardService;
        @Autowired
        private CommentService commnetService;


        @GetMapping("/save")
        public String saveForm() {
            return "boardSave";
        }

        @PostMapping("/save")
        public String save(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws IOException {
            Long memberId1 = (Long)session.getAttribute("memberId");
            System.out.println(memberId1);
            System.out.println("boardDTO controller = " + boardDTO);
            boardService.save(boardDTO,memberId1);
            return "redirect:/board/list";
        }


        @GetMapping("/list")
        public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              @RequestParam(value = "q", required = false, defaultValue = "") String q,
                              @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                              @RequestParam(value = "ord", required = false, defaultValue = "id") String ord,
                                Model model) {
            // 검색이든 아니든 필요한 정보: boardList, paging
            List<BoardDTO> boardDTOList = null;
            PageDTO pageDTO = null;
            if (q.equals("order")) {
                boardDTOList = boardService.pagingList(page,ord);
                pageDTO = boardService.pageNumber(page);

              } else if(q.equals("")) {
                // 일반 페이지 요청
                boardDTOList = boardService.pagingList(page,ord);
                pageDTO = boardService.pageNumber(page);
             } else {
                // 검색결과 페이지 요청
                boardDTOList = boardService.searchList(q, type, page, ord);
                pageDTO = boardService.searchPageNumber(q, type, page);
             }
            model.addAttribute("boardList", boardDTOList);
            model.addAttribute("paging", pageDTO);
            model.addAttribute("q", q);
            model.addAttribute("type", type);
            model.addAttribute("page", page);
            model.addAttribute("ord", ord);
            return "boardList";
        }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) throws IOException {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model)   {
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setFileAttached(0);
            boardService.update(boardDTO);
        } else {
            boardDTO.setFileAttached(1);
            boardService.update(boardDTO);
            boardService.saveFile2(boardDTO);
        }
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
        return "boardDetail";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        commnetService.commentDelete1(id);
        return "redirect:/board/list";
    }


    @GetMapping
    public String findById(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,
                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                           Model model) {
        // 조회수 처리
        // 데이터 가져오기
        boardService.updateHits(id);
        System.out.println("id = " + id);
        BoardDTO boardDTO = boardService.findById(id);
        System.out.println("boardDTO  controller findbyid= " + boardDTO);
        model.addAttribute("board", boardDTO);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTOList);
        }

        List<CommentDTO> commentDTOList = commnetService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        return "boardDetail";
    }

        @GetMapping("/sampleData")
        public String sampleData() {
            for (int i = 1; i <= 20; i++) {
                BoardDTO boardDTO1 = new BoardDTO();
                boardDTO1.setBoardWriter("aa");
                boardDTO1.setBoardTitle("title" + i);
                boardDTO1.setBoardContents("contents" + i);
                boardService.sampleData(boardDTO1);
            }
            return "redirect:/board/list";
        }


    }
