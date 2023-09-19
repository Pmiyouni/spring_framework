package com.icia.member_board.service;

import com.icia.member_board.dto.FavoriteDTO;
import com.icia.member_board.repository.FavoriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteService {
    @Autowired
    private FavoriteRepository favoriteRepository;

    public void insert(FavoriteDTO favoriteDTO) {
        favoriteRepository.insert(favoriteDTO);
    }

    public int fcount(FavoriteDTO favoriteDTO) {
        int fcnt = favoriteRepository.fcount(favoriteDTO);
        return fcnt;
    }

    public int ckcount(FavoriteDTO favoriteDTO) {
        int ckcnt = favoriteRepository.ckcount(favoriteDTO);
        return ckcnt;
    }

    public void delete(FavoriteDTO favoriteDTO) {
        favoriteRepository.delete(favoriteDTO);
    }
}
