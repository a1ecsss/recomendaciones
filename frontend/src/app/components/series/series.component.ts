import { Component, Input, type OnInit } from "@angular/core"
import { CommonModule } from "@angular/common"
import type { Series } from "../../models/series.model"
import { SeriesCardComponent } from "../series-card/series-card.component"
import { ResponseService } from "../../services/response-namagment.service"
import { SessionService } from "../../services/session.service"
import { UserSeriesRequest } from "../../models/UserSeriesRequest"


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

  constructor(private responseService: ResponseService,
    private sessionService: SessionService
  ) {
    console.log('semen')
  }

  ngOnInit() {
    console.log('INIT')
    this.updateContent();
    this.fetchSeries();
  }

  async fetchSeries(){
    const result = await this.responseService.manageAnswerGet<Series[]>(this.pageType === "dashboard" ? 'getAllSeries': 'recomendedSeries',{userId: this.sessionService.getCurrentUser()?.userId});
    console.log(result)
    if(result.status == 'SUCCESS'){
      this.series = result.value;
    }
  }

  ngOnChanges() {
    console.log("changes")
    this.updateContent()
  }

  updateContent() {
    this.pageTitle = this.pageType === "dashboard" ? "Todas las Series" : "Series Recomendadas"
    this.fetchSeries();
    //this.loadSeries()
  }

  onSeriesAction(event: { seriesId: string; action: "liked" | "watched" }) {
    event.action == 'liked' ? this.onLiked(event.seriesId) : this.onWatched(event.seriesId)
  }

  async onLiked(seriesId: string){
    const user = this.sessionService.getCurrentUser();
    const serie = this.series.find(s => s.seriesId === seriesId);
    if(user && serie){
      serie.hasLiked = !serie?.hasLiked
      const result = await this.responseService.manageAnswerPost<UserSeriesRequest, null>('hasLiked', {userId: user.userId, seriesId: seriesId})
      //console.log(result)
      if(result.status!='SUCCESS'){
        serie.hasLiked = !serie?.hasLiked
      }
    }
  }

  async onWatched(seriesId: string){
    const user = this.sessionService.getCurrentUser();
    const serie = this.series.find(s => s.seriesId === seriesId);
    if(user && serie){
      serie.hasWatched = !serie?.hasWatched
      const result = await this.responseService.manageAnswerPost<UserSeriesRequest, null>('hasWatched', {userId: user.userId, seriesId: seriesId})
      //console.log(result)
      if(result.status!='SUCCESS'){
        serie.hasWatched = !serie?.hasWatched
      }
    }
  }


}
