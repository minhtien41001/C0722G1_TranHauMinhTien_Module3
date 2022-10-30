package com.example.service;

import com.example.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IStudentService {

    Page<Student> findAll(Pageable pageable);

    Student findById(int id);

    void save(Student student);
}
