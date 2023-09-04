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

    public int save(StudentDTO studentDTO) {
        return sql.insert("Student.save", studentDTO);
    }

    public List<StudentDTO> findAll() {
        return sql.selectList("Student.findAll");
    }

    public StudentDTO findById(Long id) {
        return sql.selectOne("Student.findById", id);
    }

    public void update(StudentDTO studentDTO) {
        sql.update("Student.update", studentDTO);
    }

    public void delete(Long id) {
        sql.delete("Student.delete", id);
    }
}
