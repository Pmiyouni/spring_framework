package com.icia.student.repository;

import com.icia.student.dto.StudentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(StudentDTO studentDTO)    {
        return sql.insert("Student.save",studentDTO);
        //insert 완료된 숫자만큼 리턴됨, insert 안되면 0이 리턴
    }

    public List<StudentDTO> list() {
        return sql.selectList("Student.list");
    }

    public StudentDTO detail(Long id) {
        return sql.selectOne("Student.detail",id);
    }

    public void update(StudentDTO studentDTO1) {
       sql.update("Student.update",studentDTO1);
    }

    public void delete(Long id) {
        sql.delete("Student.delete",id);
    }
}
