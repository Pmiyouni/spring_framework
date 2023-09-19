package com.icia.member_board.repository;

import com.icia.member_board.dto.CommentDTO;
import com.icia.member_board.dto.FavoriteDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public void insert(FavoriteDTO favoriteDTO) {
        sql.insert("Favorite.insert", favoriteDTO);
    }

    public int fcount(FavoriteDTO favoriteDTO) {
        return sql.selectOne("Favorite.fcount",favoriteDTO);
    }

    public int ckcount(FavoriteDTO favoriteDTO) {
        return sql.selectOne("Favorite.ckcount",favoriteDTO);
    }

    public void delete(FavoriteDTO favoriteDTO) {
        sql.delete("Favorite.delete", favoriteDTO);
    }

}

