package com.icia.member_board.service;

import com.icia.member_board.dto.CommentDTO;
import com.icia.member_board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }

    public void commentDelete(Long id) {
        commentRepository.commentDelete(id);
    }

    public void commentDelete1(Long id) {
        commentRepository.commentDelete1(id);
    }
}
