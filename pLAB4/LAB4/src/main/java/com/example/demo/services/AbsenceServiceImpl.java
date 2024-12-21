package com.example.demo.services;

import com.example.demo.models.Absence;
import com.example.demo.models.Student;
import com.example.demo.repositories.AbsenceRepository;
import com.example.demo.repositories.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AbsenceServiceImpl implements AbsenceService {

    @Autowired
    private AbsenceRepository absenceRepository;
    @Autowired
    private StudentRepository studentRepository;


    @Override
    public List<Absence> getAllAbsences() {
        return absenceRepository.findAll();
    }

    @Override
    public Absence getAbsenceById(Long id) {
        return absenceRepository.findById(id).orElse(null);
    }

    @Override
    public Absence saveAbsence(Absence absence) {
        // Fetch the student by ID
        Optional<Student> studentOptional = studentRepository.findById(absence.getStudent().getId());

        // Check if the student exists
        if (studentOptional.isPresent()) {
            // Set the student to the absence object
            absence.setStudent(studentOptional.get());
        } else {
            // Handle the case where the student is not found
            throw new RuntimeException("Student with ID " + absence.getStudent().getId() + " not found");
        }

        // Save and return the absence
        return absenceRepository.save(absence);
    }


    @Override
    public void deleteAbsence(Long id) {
        absenceRepository.deleteById(id);
    }

    @Override
    public Absence editAbsence(Long id, Absence absence) {
        Absence existingAbsence = getAbsenceById(id);
        if (existingAbsence == null) {
            throw new RuntimeException("Absence with ID " + id + " not found");
        }
        existingAbsence.setDate(absence.getDate());
        existingAbsence.setReason(absence.getReason());
        existingAbsence.setJustified(absence.isJustified());
        existingAbsence.setStudent(absence.getStudent());
        return saveAbsence(existingAbsence);
    }
}

