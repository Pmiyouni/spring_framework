package com.icia.student.controller;

import com.icia.student.dto.StudentDTO;
import com.icia.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @GetMapping("/save")
    public String save(){
        return "save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute StudentDTO studentDTO) {
        boolean result= studentService.save(studentDTO);
        if(result){
            System.out.println("학생 등록 성공");
            return "index";
        } else{
            System.out.println("학생등록 실패");
            return "save";
        }
    }
    @PostMapping("/list")
    public String list(Model model){
        //Model은 가져갈 것이 있을때 사용
        List<StudentDTO> studentDTOList = studentService.list();
        System.out.println("studentDTOList = " + studentDTOList);
        model.addAttribute("studentList",studentDTOList);
        //화면에 가져갈 데이터
        return "list";
        //브라우저에 출력할 jsp 파일 이름
    }


    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model) {
        StudentDTO studentDTO = studentService.detail(id);
        model.addAttribute("student", studentDTO);
        return "detail";
    }


    @GetMapping("/update")
    public String update(@RequestParam("id") Long id){
        return "update";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute StudentDTO studentDTO){
        studentService.update(studentDTO);
        return "index";
    }
    @PostMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
         studentService.delete(id);
          return "index";
    }
}
