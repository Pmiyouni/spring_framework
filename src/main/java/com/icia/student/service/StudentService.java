package com.icia.student.service;

import com.icia.student.dto.StudentDTO;
import com.icia.student.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;
    public boolean save(StudentDTO studentDTO) {
        int result= studentRepository.save(studentDTO);
        if(result >0){  //0보다 큰 경우는 데이터 등록이 하나라도 성공한 경우
            return true;
        } else{
            return false;
        }
    }

    public List<StudentDTO> list() {
        List<StudentDTO> studentDTOList = studentRepository.list();
        return studentDTOList;
        //return studentRepository.list();

    }

    public StudentDTO detail(Long id) {
        return studentRepository.detail(id);
    }


    public void update(StudentDTO studentDTO1) {
        studentRepository.update(studentDTO1);
    }

    public void delete(Long id) {
        studentRepository.delete(id);
    }
}
