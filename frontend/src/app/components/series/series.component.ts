import { Component, Input, type OnInit } from "@angular/core"
import { CommonModule } from "@angular/common"
import type { Series } from "../../models/series.model"
import { SeriesCardComponent } from "../series-card/series-card.component"
import { ResponseService } from "../../services/response-namagment.service"

@Component({
  selector: "app-series",
  standalone: true,
  imports: [CommonModule, SeriesCardComponent],
  templateUrl: "./series.component.html",
  styleUrls: ["./series.component.css"],
})
export class SeriesComponent implements OnInit {
  @Input() pageType: "dashboard" | "recommended" = "dashboard"

  series: Series[] = []
  pageTitle = ""

  constructor(private responseService: ResponseService) {
    console.log('semen')
  }

  ngOnInit() {
    console.log('INIT')
    this.updateContent();
    this.fetchSeries();
  }

  async fetchSeries(){
    const result = await this.responseService.manageAnswerGet<Series[]>('getAllSeries',{});
    console.log(result)
    if(result.status == 'SUCCESS'){
      this.series = result.value;
    }
  }

  ngOnChanges() {
    this.updateContent()
  }

  updateContent() {
    this.pageTitle = this.pageType === "dashboard" ? "Todas las Series" : "Series Recomendadas"
    this.fetchSeries();
    //this.loadSeries()
  }

  onSeriesAction(event: { seriesId: string; action: "liked" | "watched" }) {
    console.log(`Serie ${event.seriesId} marcada como ${event.action}`)
  }


}
