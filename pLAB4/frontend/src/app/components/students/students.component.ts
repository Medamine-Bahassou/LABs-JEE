import {Component, OnInit} from '@angular/core';
import {StudentsService} from '../../services/students.service';
import {Classe, ClasseService} from '../../services/classe.service';

@Component({
  selector: 'app-students',
  standalone: false,

  templateUrl: './students.component.html',
  styleUrl: './students.component.scss'
})
export class StudentsComponent implements OnInit {
  students: any[] = [];
  classes: any[] = [];
  studentForm: any = {
    id: null,
    firstName: '',
    lastName: '',
    dateOfBirth: '',
    classe: {id:null}
  };
  isEditMode = false;

  constructor(private studentService: StudentsService, private classeService: ClasseService) {}

  ngOnInit(): void {
    this.getStudents();
    this.getClasses();
  }

  getStudents(): void {
    this.studentService.getStudents().subscribe((data) => {
      this.students = data;
    });
  }

  // Method to get all classes
  getClasses() {
    this.classeService.getClasses().subscribe((data: Classe[]) => {
      this.classes = data;  // Assign the response to the classes array
    });
  }

  saveStudent(): void {
    if (this.isEditMode) {
      this.studentService.updateStudent(this.studentForm.id, this.studentForm).subscribe(() => {
        this.resetForm();
        this.getStudents();
      });
    } else {
      this.studentService.addStudent(this.studentForm).subscribe(() => {
        this.resetForm();
        this.getStudents();
      });
    }
  }

  editStudent(student: any): void {
    this.studentForm = { ...student, classeId: student.classe?.id };
    this.isEditMode = true;
  }

  deleteStudent(id: number): void {
    this.studentService.deleteStudent(id).subscribe(() => {
      this.getStudents();
    });
  }

  resetForm(): void {
    this.studentForm = {
      id: null,
      firstName: '',
      lastName: '',
      dateOfBirth: '',
      classeId: null
    };
    this.isEditMode = false;
  }
}

