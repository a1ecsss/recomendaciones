import type { Routes } from "@angular/router"
import { LoginComponent } from "./components/login/login.component"
import { SignupComponent } from "./components/signup/signup.component"
import { HomeComponent } from "./components/home/home.component"
import { SeriesComponent } from "./components/series/series.component"
import { AuthGuard } from './guards/auth.guard';

export const routes: Routes = [
  { path: "", redirectTo: "/login", pathMatch: "full" },
  { path: "login", component: LoginComponent, canActivate: [AuthGuard] },
  { path: "signup", component: SignupComponent, canActivate: [AuthGuard] },
  { path: "home", component: HomeComponent },
  { path: "dashboard", component: SeriesComponent, data: { type: "dashboard" } },
  { path: "recommended", component: SeriesComponent, data: { type: "recommended" } },
  { path: "**", redirectTo: "/login" },
];
