package com.example.controller;

import com.example.dto.StudentDto;
import com.example.model.Student;
import com.example.service.IClassRoomService;
import com.example.service.ICourseService;
import com.example.service.IStudentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;


@Controller
public class StudentController {

    @Autowired
    private IStudentService iStudentService;

    @Autowired
    private IClassRoomService iClassRoomService;

    @Autowired
    private ICourseService iCourseService;

    @GetMapping("/")
    public String showAllStudent(@PageableDefault(value = 2)Pageable pageable,
                                 Model model){
      model.addAttribute("studentList",iStudentService.findAll(pageable));
      return "/list";
    }

    @GetMapping("/create")
    public String showFormCreate(Model model){
        model.addAttribute("classRoomList",iClassRoomService.findAll());

        model.addAttribute("courseList",iCourseService.findAll());

        model.addAttribute("studentDto",new StudentDto());

        return "/create";
    }

    @PostMapping("/create")
    public String saveStudent(@Validated @ModelAttribute StudentDto studentDto,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes,
                              Model model){
        new StudentDto().validate(studentDto,bindingResult);

        if(bindingResult.hasFieldErrors()){
            model.addAttribute("classRoomList",iClassRoomService.findAll());

            model.addAttribute("courseList",iCourseService.findAll());
            return "/create";
        }else {
            studentDto.getAccount().getDateCreate(new Date(System.currentTimeMillis()));

            Student student = new Student();
            BeanUtils.copyProperties(studentDto,student);
            iStudentService.save(student);
            return "redirect:/";
        }
    }
}
