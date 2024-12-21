package com.example.demo.services;


import com.example.demo.models.Classe;
import com.example.demo.models.Student;
import com.example.demo.repositories.ClasseRepository;
import com.example.demo.repositories.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private ClasseRepository classeRepository;

    @Override
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    @Override
    public Student saveStudent(Student student) {
        if (student.getClasse() != null && student.getClasse().getId() != null) {
            // Fetch the Classe from the database
            Classe classe = classeRepository.findById(student.getClasse().getId())
                    .orElseThrow(() -> new RuntimeException("Classe with ID " + student.getClasse().getId() + " not found"));

            // Set the fetched Classe into the Student entity
            student.setClasse(classe);
        } else {
            throw new IllegalArgumentException("Classe information is missing or invalid.");
        }

        // Save the Student
        return studentRepository.save(student);
    }

    @Override
    public void deleteStudent(Long id) {
        try {
            studentRepository.deleteById(id);
        } catch (Exception e) {
            // Log the exception for debugging
            System.err.println("Error deleting student with id " + id + ": " + e.getMessage());
            throw new RuntimeException("Error deleting student");  // Or handle as needed
        }
    }


    @Override
    public Student editStudent(Long id, Student student) {
        // Fetch the existing student
        Student existingStudent = getStudentById(id);
        if (existingStudent == null) {
            throw new RuntimeException("Student with ID " + id + " not found");
        }

        // Update the fields of the existing student
        existingStudent.setFirstName(student.getFirstName());
        existingStudent.setLastName(student.getLastName());
        existingStudent.setDateOfBirth(student.getDateOfBirth());
        existingStudent.setClasse(student.getClasse());
        existingStudent.setAbsences(student.getAbsences());

        // Save the updated student
        return saveStudent(existingStudent);
    }
}
