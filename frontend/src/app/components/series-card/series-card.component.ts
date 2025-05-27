import { Component, Input, Output, EventEmitter } from "@angular/core"
import { CommonModule } from "@angular/common"
import type { Series } from "../../models/series.model"

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

  onLiked() {
    this.seriesAction.emit({ seriesId: this.series.seriesId, action: "liked" })
  }

  onWatched() {
    this.seriesAction.emit({ seriesId: this.series.seriesId, action: "watched" })
  }
}
