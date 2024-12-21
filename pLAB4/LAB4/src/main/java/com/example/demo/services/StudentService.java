package com.example.demo.services;

import com.example.demo.models.Student;

import java.util.List;

public interface StudentService {
    List<Student> getAllStudents();
    Student getStudentById(Long id);
    Student saveStudent(Student student);
    void deleteStudent(Long id);
    Student editStudent(Long id, Student student);
}