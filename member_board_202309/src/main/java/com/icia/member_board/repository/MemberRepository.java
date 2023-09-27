package com.icia.member_board.repository;

import com.icia.member_board.dto.BoardDTO;
import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.dto.ProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public void saveFile(ProfileDTO profileDTO) {
        sql.insert("Member.saveFile", profileDTO);
    }
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public ProfileDTO findFile(Long id) {
        return sql.selectOne("Member.findFile", id);
    }

    public void remove(Long id) {
                  sql.update("Member.remove", id);
    }

    public List<MemberDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Member.pagingList", pagingParams);
    }

    public List<MemberDTO> searchList(Map<String, Object> searchParam) {
        return sql.selectList("Member.search", searchParam);
    }
    public int memberCount() {
        return sql.selectOne("Member.count");
    }
    public int memberSearchCount(Map<String, String> pagingParams) {
        return sql.selectOne("Member.searchCount", pagingParams);
    }

}
