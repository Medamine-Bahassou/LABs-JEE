package com.example.demo.services;

import com.example.demo.models.Classe;
import com.example.demo.repositories.ClasseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClasseServiceImpl implements ClasseService {

    @Autowired
    private ClasseRepository classeRepository;

    @Override
    public List<Classe> getAllClasses() {
        return classeRepository.findAll();
    }

    @Override
    public Classe getClasseById(Long id) {
        return classeRepository.findById(id).orElse(null);
    }

    @Override
    public Classe saveClasse(Classe classe) {
        return classeRepository.save(classe);
    }

    @Override
    public void deleteClasse(Long id) {
        classeRepository.deleteById(id);
    }

    @Override
    public Classe editClasse(Long id, Classe classe) {
        Classe existingClasse = getClasseById(id);
        if (existingClasse == null) {
            throw new RuntimeException("Classe with ID " + id + " not found");
        }
        existingClasse.setName(classe.getName());
        existingClasse.setLevel(classe.getLevel());
        return saveClasse(existingClasse);
    }
}
