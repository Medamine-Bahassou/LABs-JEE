import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { StudentsComponent } from './components/students/students.component';
import {AbsenceComponent} from './components/absence/absence.component';
import {ClasseComponent} from './components/classe/classe.component';

const routes: Routes = [
  { path: '', redirectTo: '/student', pathMatch: 'full' }, // Redirect from root to /student
  { path: 'student', component: StudentsComponent }, // Define the route for StudentsComponent
  { path: 'absences', component: AbsenceComponent },
  { path: 'classes', component: ClasseComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
