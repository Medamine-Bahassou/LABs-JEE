import {Component, OnInit} from '@angular/core';
import {Absence, AbsenceService} from '../../services/absence.service';
import {StudentsService} from '../../services/students.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-absence',
  standalone: false,

  templateUrl: './absence.component.html',
  styleUrl: './absence.component.scss'
})
export class AbsenceComponent implements OnInit {
  absences: Absence[] = [];
  absenceForm: FormGroup;
  isEditing = false;
  currentAbsenceId: number | null = null;
  students: any = []

  constructor(
    private absenceService: AbsenceService,
    private studentsService:StudentsService,
    private fb: FormBuilder
  ) {
    this.absenceForm = this.fb.group({
      date: ['', Validators.required],
      reason: ['', Validators.required],
      justified: [false],
      student: [null, Validators.required]
    });
  }

  ngOnInit(): void {
    this.loadAbsences();
    this.loadStudents();
  }

  loadStudents(): void {
    this.studentsService.getStudents().subscribe({
      next: (data) => {
        this.students = data;
      },
      error: (error) => {
        console.error('Error fetching students:', error);
      }

    })
  }

  loadAbsences(): void {
    this.absenceService.getAllAbsences().subscribe({
      next: (data) => {
        this.absences = data;
      },
      error: (error) => {
        console.error('Error fetching absences:', error);
      }
    });
  }

  onSubmit(): void {
    if (this.absenceForm.valid) {
      const absenceData = this.absenceForm.value;

      // Ensure the student field is an object with the id property
      absenceData.student = { id: absenceData.student };

      console.log('Form Data:', absenceData);  // Log the data to check the structure

      if (this.isEditing && this.currentAbsenceId) {
        this.absenceService.updateAbsence(this.currentAbsenceId, absenceData).subscribe({
          next: () => {
            this.loadAbsences();
            this.resetForm();
          },
          error: (error) => {
            console.error('Error updating absence:', error);
          }
        });
      } else {
        this.absenceService.createAbsence(absenceData).subscribe({
          next: () => {
            this.loadAbsences();
            this.resetForm();
          },
          error: (error) => {
            console.error('Error creating absence:', error);
          }
        });
      }
    } else {
      console.error('Form is invalid');
    }
  }

  editAbsence(absence: Absence): void {
    this.isEditing = true;
    this.currentAbsenceId = absence.id!;
    this.absenceForm.patchValue({
      date: absence.date,
      reason: absence.reason,
      justified: absence.justified,
      student: absence.student
    });
  }

  deleteAbsence(id: number): void {
    if (confirm('Are you sure you want to delete this absence?')) {
      this.absenceService.deleteAbsence(id).subscribe({
        next: () => {
          this.loadAbsences();
        },
        error: (error) => {
          console.error('Error deleting absence:', error);
        }
      });
    }
  }

  resetForm(): void {
    this.absenceForm.reset();
    this.isEditing = false;
    this.currentAbsenceId = null;
  }
}
