package com.example.demo.controllers;

import com.example.demo.models.Absence;
import com.example.demo.services.AbsenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/absences")
@CrossOrigin("*")
public class AbsenceController {

    @Autowired
    private AbsenceService absenceService;

    @GetMapping
    public List<Absence> getAllAbsences() {
        return absenceService.getAllAbsences();
    }

    @GetMapping("/{id}")
    public Absence getAbsence(@PathVariable Long id) {
        return absenceService.getAbsenceById(id);
    }

    @PostMapping
    public Absence createAbsence(@RequestBody Absence absence) {
        return absenceService.saveAbsence(absence);
    }

    @PutMapping("/{id}")
    public Absence updateAbsence(@PathVariable Long id, @RequestBody Absence absence) {
        return absenceService.editAbsence(id, absence);
    }

    @DeleteMapping("/{id}")
    public void deleteAbsence(@PathVariable Long id) {
        absenceService.deleteAbsence(id);
    }
}
