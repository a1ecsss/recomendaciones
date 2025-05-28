import { Component } from "@angular/core"
import { Router } from "@angular/router"
import { FormsModule } from "@angular/forms"
import { CommonModule } from "@angular/common"
import { ResponseService } from "../../services/response-namagment.service"
import { User } from "../../models/user.model"
import { SnackBarService } from "../../services/SnackBarService.service"
import { SessionService } from "../../services/session.service"

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

  constructor(private router: Router,
    private responseService: ResponseService,
    private snackBarService: SnackBarService,
    private sessionService: SessionService
  ) {}

  async onLogin() {
    if (this.username && this.password) {
      const result = await this.responseService.manageAnswerGet<User>('login',{
        username: this.username,
        password: this.password
      })
      this.snackBarService.showMessage(result);
      if (result.status == 'SUCCESS'){
        this.sessionService.setUser(result.value);
        this.router.navigate(["/home"]);
      }
    }
  }

  goToSignup() {
    this.router.navigate(["/signup"])
  }
}
