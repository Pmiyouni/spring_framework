package com.icia.student.controller;

import com.icia.student.dto.StudentDTO;
import com.icia.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    //화면 띄움
    @GetMapping("/save")
    public String saveForm() {
        return "save";
    }
// 등록
    @PostMapping("/save")
    public String save(@ModelAttribute StudentDTO studentDTO) {
        boolean result = studentService.save(studentDTO);
        if (result) {
            System.out.println("학생등록 성공");
            return "index";
        } else {
            System.out.println("학생등록 실패");
            return "save";
        }
    }
//목록
    @GetMapping("/list")
    public String findAll(Model model) {
        List<StudentDTO> studentDTOList = studentService.findAll();
        model.addAttribute("studentList", studentDTOList); // => 화면에 가져갈 데이터
        return "list"; // => 브라우저에 출력할 jsp 파일 이름
    }

    //조회
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        StudentDTO studentDTO = studentService.findById(id);
        model.addAttribute("student", studentDTO);
        return "detail";
    }

    //수정을 위한 조회
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        StudentDTO studentDTO = studentService.findById(id);
        model.addAttribute("student", studentDTO);
        //model은 1회용으로 처리
        return "update";
    }

    //수정을 위한 처리
    @PostMapping("/update")
    public String update(@ModelAttribute StudentDTO studentDTO) {
        studentService.update(studentDTO);
        // 수정처리 후 redirect 방식으로 /list 주소값 요청
        //return list;으로 하면 그냥 단순히 list.jsp(화면)로 띄움(빈 데이터)
        // redirect(재요청) =>화면으로 가지 않고 controller에서의 list주소 요청으로 다시 감
            return "redirect:/list";
            // 수행 후 주소줄에 list로 나옴
    }

    //삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, Model model) {
        studentService.delete(id);
        // redirect 방식 쓰지 않고 직접 리스트 가져와서 list.jsp로 이동
        List<StudentDTO> studentDTOList = studentService.findAll();
        model.addAttribute("studentList", studentDTOList);
        return "list";
        //list.jsp 가기전에 리스트 데이터를 주어서 보여줌
        // 데이터를 담음으로 redirect 필요없음
        // 처리 후  주소줄에 그대로 delete 보여짐
    }
}