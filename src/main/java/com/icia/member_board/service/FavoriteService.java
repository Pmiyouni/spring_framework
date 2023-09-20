package com.icia.member_board.service;

import com.icia.member_board.dto.FavoriteDTO;
import com.icia.member_board.dto.NotfavoriteDTO;
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


    public void insert2(NotfavoriteDTO notfavoriteDTO) {
        favoriteRepository.insert2(notfavoriteDTO);
    }

    public int ncount(NotfavoriteDTO notfavoriteDTO) {
        int ncnt = favoriteRepository.ncount(notfavoriteDTO);
        return ncnt;
    }

    public int ckcount2(NotfavoriteDTO notfavoriteDTO) {
        int ckcnt2 = favoriteRepository.ckcount2(notfavoriteDTO);
        return ckcnt2;
    }
}
