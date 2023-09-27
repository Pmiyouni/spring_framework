package com.icia.member_board.repository;

import com.icia.member_board.dto.CommentDTO;
import com.icia.member_board.dto.FavoriteDTO;
import com.icia.member_board.dto.NotfavoriteDTO;
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


    public void insert2(NotfavoriteDTO notfavoriteDTO) {
        sql.insert("Favorite.insert2", notfavoriteDTO);
    }

    public int ncount(NotfavoriteDTO notfavoriteDTO) {
        return sql.selectOne("Favorite.ncount",notfavoriteDTO);
    }

    public int ckcount2(NotfavoriteDTO notfavoriteDTO) {
        return sql.selectOne("Favorite.ckcount2",notfavoriteDTO );
    }
}

