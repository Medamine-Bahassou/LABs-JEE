package com.example.demo.repositories;

import com.example.demo.models.Absence;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AbsenceRepository extends JpaRepository<Absence, Long> {
}