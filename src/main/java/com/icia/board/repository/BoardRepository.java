package com.icia.board.repository;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById",id);
    }

    public void delete(Long id) {
        sql.delete("Board.delete",id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public BoardDTO findByPassword(String boardPass) {
        return sql.selectOne("Board.findByPassword",boardPass);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public List<BoardDTO> search(HashMap<String, String> map) {
        return sql.selectList("Board.search", map);

    }

    public void saveFile(BoardFileDTO boardFileDTO) {
    sql.insert("Board.saveFile",boardFileDTO);
    }

    public BoardFileDTO findFile(Long boardId) {
        return sql.selectOne("Board.findFile",boardId);
    }
}