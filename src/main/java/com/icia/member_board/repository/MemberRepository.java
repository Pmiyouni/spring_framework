package com.icia.member_board.repository;

import com.icia.member_board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO) {

        sql.insert("Member.save", memberDTO);
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);

    }
}