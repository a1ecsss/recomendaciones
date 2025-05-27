import { Component } from "@angular/core"
import { Router } from "@angular/router"
import { FormsModule } from "@angular/forms"
import { CommonModule } from "@angular/common"

@Component({
  selector: "app-login",
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.css"],
})
export class LoginComponent {
  username = ""
  password = ""

  constructor(private router: Router) {}

  onLogin() {
    if (this.username && this.password) {
      console.log("Login:", { username: this.username, password: this.password })
      this.router.navigate(["/home"])
    }
  }

  goToSignup() {
    this.router.navigate(["/signup"])
  }
}
