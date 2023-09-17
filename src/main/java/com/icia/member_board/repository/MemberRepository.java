package com.icia.member_board.repository;

import com.icia.member_board.dto.MemberDTO;
import com.icia.member_board.dto.ProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}