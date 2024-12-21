package com.example.demo.services;

import com.example.demo.models.Classe;
import java.util.List;

public interface ClasseService {
    List<Classe> getAllClasses();
    Classe getClasseById(Long id);
    Classe saveClasse(Classe classe);
    void deleteClasse(Long id);
    Classe editClasse(Long id, Classe classe);
}
