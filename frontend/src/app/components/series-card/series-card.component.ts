import { Component, Input, Output, EventEmitter } from "@angular/core"
import { CommonModule } from "@angular/common"
import type { Series } from "../../models/series.model"
import { ResponseService } from "../../services/response-namagment.service"
import { UserSeriesRequest } from "../../models/UserSeriesRequest"
import { SessionService } from "../../services/session.service"

@Component({
  selector: "app-series-card",
  standalone: true,
  imports: [CommonModule],
  templateUrl: "./series-card.component.html",
  styleUrls: ["./series-card.component.css"],
})
export class SeriesCardComponent {
  @Input() series!: Series
  @Output() seriesAction = new EventEmitter<{ seriesId: string; action: "liked" | "watched" }>()

  constructor(private responseService: ResponseService,
    private sessionService: SessionService
  ) {}

  onLiked() {
    this.seriesAction.emit({ seriesId: this.series.seriesId, action: "liked" })
  }

  onWatched() {
    this.seriesAction.emit({ seriesId: this.series.seriesId, action: "watched" })
  }
}

//this.responseService.manageAnswerPost<UserSeriesRequest, null>('hasLiked', {userId: this.sessionService.currentUser()?.userId, seriesId: this.series.seriesId})
