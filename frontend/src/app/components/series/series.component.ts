import { Component, Input, type OnInit } from "@angular/core"
import { CommonModule } from "@angular/common"
import type { Series } from "../../models/series.model"
import { SeriesCardComponent } from "../series-card/series-card.component"

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

  ngOnInit() {
    this.updateContent()
  }

  ngOnChanges() {
    this.updateContent()
  }

  updateContent() {
    this.pageTitle = this.pageType === "dashboard" ? "Todas las Series" : "Series Recomendadas"
    this.loadSeries()
  }

  loadSeries() {
    this.series = this.getMockSeries()
  }

  onSeriesAction(event: { seriesId: string; action: "liked" | "watched" }) {
    console.log(`Serie ${event.seriesId} marcada como ${event.action}`)
  }

  private getMockSeries(): Series[] {
    const allSeries = [
      {
        seriesId: "1",
        name: "Breaking Bad",
        rating: 9.5,
        numOfRatings: 1500000,
        description: "Un profesor de química se convierte en fabricante de metanfetaminas.",
        year: 2008,
        duration: 47,
        totalSeasons: 5,
        totalEpisodes: 62,
        image: "/placeholder.svg?height=400&width=300",
      },
      {
        seriesId: "2",
        name: "Stranger Things",
        rating: 8.7,
        numOfRatings: 1200000,
        description: "Un grupo de niños descubre fuerzas sobrenaturales en su pequeño pueblo.",
        year: 2016,
        duration: 51,
        totalSeasons: 4,
        totalEpisodes: 42,
        image: "/placeholder.svg?height=400&width=300",
      },
      {
        seriesId: "3",
        name: "The Crown",
        rating: 8.6,
        numOfRatings: 800000,
        description: "La vida de la Reina Isabel II y la familia real británica.",
        year: 2016,
        duration: 58,
        totalSeasons: 6,
        totalEpisodes: 60,
        image: "/placeholder.svg?height=400&width=300",
      },
      {
        seriesId: "4",
        name: "Game of Thrones",
        rating: 9.2,
        numOfRatings: 2000000,
        description: "Familias nobles luchan por el control del Trono de Hierro.",
        year: 2011,
        duration: 57,
        totalSeasons: 8,
        totalEpisodes: 73,
        image: "/placeholder.svg?height=400&width=300",
      },
      {
        seriesId: "5",
        name: "The Office",
        rating: 8.9,
        numOfRatings: 900000,
        description: "Comedia sobre la vida en una oficina de ventas de papel.",
        year: 2005,
        duration: 22,
        totalSeasons: 9,
        totalEpisodes: 201,
        image: "/placeholder.svg?height=400&width=300",
      },
      {
        seriesId: "6",
        name: "Friends",
        rating: 8.8,
        numOfRatings: 1100000,
        description: "Seis amigos navegan por la vida y el amor en Nueva York.",
        year: 1994,
        duration: 22,
        totalSeasons: 10,
        totalEpisodes: 236,
        image: "/placeholder.svg?height=400&width=300",
      },
    ]

    // Si es recomendaciones, mostrar solo las primeras 3
    return this.pageType === "recommended" ? allSeries.slice(0, 3) : allSeries
  }
}
