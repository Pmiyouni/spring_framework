package com.icia.member_board.repository;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO ) {
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }
    public void saveFile(BoardFileDTO boardFileDTO)
    {
        sql.insert("Board.saveFile", boardFileDTO);
    }
    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public List<BoardDTO> searchList(Map<String, Object> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }


    public int boardSearchCount(Map<String, String> pagingParams) {
        return sql.selectOne("Board.searchCount", pagingParams);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById",id);
    }


    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public void delete(Long id) {
        sql.delete("Board.delete",id);
    }


    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public List<BoardFileDTO> findFile(Long aId) {
        return sql.selectList("Board.findFile",aId);
    }

    public void boardDelete(Long mId) {
        sql.delete("Board.boardDelete",mId);
    }
}
