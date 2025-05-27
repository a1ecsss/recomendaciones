import { Component } from "@angular/core"
import { Router } from "@angular/router"
import { FormsModule } from "@angular/forms"
import { CommonModule } from "@angular/common"
import type { User } from "../../models/user.model"

@Component({
  selector: "app-signup",
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: "./signup.component.html",
  styleUrls: ["./signup.component.css"],
})
export class SignupComponent {
  user: User = {
    userId: "",
    username: "",
    password: "",
    importanceGenre: 3,
    importanceActor: 3,
    importanceDirector: 3,
    importanceRating: 3,
    importanceLanguage: 3,
    importanceCountry: 3,
    importanceYear: 3,
    importanceDuration: 3,
  }

  likertQuestions = [
    { key: "importanceGenre", label: "Género de la serie", icon: "drama" },
    { key: "importanceActor", label: "Actores", icon: "users" },
    { key: "importanceDirector", label: "Director", icon: "video" },
    { key: "importanceRating", label: "Calificación", icon: "star" },
    { key: "importanceLanguage", label: "Idioma", icon: "globe" },
    { key: "importanceCountry", label: "País de origen", icon: "map" },
    { key: "importanceYear", label: "Año de lanzamiento", icon: "calendar" },
    { key: "importanceDuration", label: "Duración de episodios", icon: "clock" },
  ]

  likertLabels = ["Nada importante", "Poco importante", "Moderadamente importante", "Importante", "Muy importante"]

  constructor(private router: Router) {}

  onSignup() {
    if (this.user.username && this.user.password) {
      this.user.userId = this.generateUserId()
      console.log("Signup:", this.user)
      this.router.navigate(["/home"])
    }
  }

  goToLogin() {
    this.router.navigate(["/login"])
  }

  setLikertValue(questionKey: string, value: number) {
    ;(this.user as any)[questionKey] = value
  }

  getLikertValue(questionKey: string): number {
    return (this.user as any)[questionKey]
  }

  private generateUserId(): string {
    return "user_" + Math.random().toString(36).substr(2, 9)
  }
}
