import { Component, OnInit } from '@angular/core';
import { Classe, ClasseService } from '../../services/classe.service';

@Component({
  selector: 'app-classe',
  standalone: false,
  templateUrl: './classe.component.html',
  styleUrls: ['./classe.component.scss']
})
export class ClasseComponent implements OnInit {
  classes: Classe[] = [];
  classeForm: Classe = { id: null, name: '', level: '' };
  isEditMode = false;

  constructor(private classeService: ClasseService) {}

  ngOnInit() {
    this.getClasses();
  }

  getClasses() {
    this.classeService.getAllClasses().subscribe((data: Classe[]) => {
      this.classes = data;
    });
  }

  saveClasse() {
    if (this.classeForm.id !== null) {
      // Update the class
      this.classeService.updateClasse(this.classeForm.id, this.classeForm).subscribe(() => {
        this.getClasses();
        this.resetForm();
      });
    } else {
      // Create a new class if no id
      this.classeService.createClasse(this.classeForm).subscribe(() => {
        this.getClasses();
        this.resetForm();
      });
    }
  }

  editClasse(classe: Classe) {
    this.classeForm = { ...classe };
    this.isEditMode = true;
  }

  deleteClasse(id: number | null) {
    if (id !== null) { // Ensure id is not null
      this.classeService.deleteClasse(id).subscribe(() => {
        this.getClasses();
      });
    } else {
      console.error('Invalid ID');
    }
  }

  resetForm() {
    this.classeForm = { id: null, name: '', level: '' };
    this.isEditMode = false;
  }
}
