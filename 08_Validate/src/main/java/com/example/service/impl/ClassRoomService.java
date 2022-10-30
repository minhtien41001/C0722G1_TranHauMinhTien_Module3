package com.example.service.impl;

import com.example.model.ClassRoom;
import com.example.repository.IClassRoomRepository;
import com.example.service.IClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ClassRoomService implements IClassRoomService {

    @Autowired
    private IClassRoomRepository iClassRoomRepository;

    @Override
    public List<ClassRoom> findAll() {
        return iClassRoomRepository.findAll();
    }
}
