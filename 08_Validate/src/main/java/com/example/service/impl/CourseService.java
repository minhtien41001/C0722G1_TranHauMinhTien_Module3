package com.example.service.impl;

import com.example.model.Course;
import com.example.repository.ICourseRepository;
import com.example.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class CourseService implements ICourseService {

    @Autowired
    private ICourseRepository iCourseRepository;

    @Override
    public List<Course> findAll() {
        return iCourseRepository.findAll();
    }
}
