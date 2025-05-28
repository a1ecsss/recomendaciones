import { Component, type OnInit } from "@angular/core"
import { Router } from "@angular/router"
import { CommonModule } from "@angular/common"
import { SeriesComponent } from "../series/series.component"
import { SessionService } from "../../services/session.service"

@Component({
  selector: "app-home",
  standalone: true,
  imports: [CommonModule, SeriesComponent],
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.css"],
})
export class HomeComponent implements OnInit {
  activeTab: "dashboard" | "recommended" = "dashboard"

  constructor(private router: Router,
    public sessionService: SessionService
  ) {}

  ngOnInit() {
    // Por defecto mostrar dashboard
    this.activeTab = "dashboard"
  }

  setActiveTab(tab: "dashboard" | "recommended") {
    this.activeTab = tab
  }

  logout() {
    this.sessionService.clearUser();
    this.router.navigate(["/login"])
  }
}
