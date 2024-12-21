package com.example.demo.services;

import com.example.demo.models.Absence;
import java.util.List;

public interface AbsenceService {
    List<Absence> getAllAbsences();
    Absence getAbsenceById(Long id);
    Absence saveAbsence(Absence absence);
    void deleteAbsence(Long id);
    Absence editAbsence(Long id, Absence absence);
}
