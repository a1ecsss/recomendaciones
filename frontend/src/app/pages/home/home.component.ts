import { Component, OnInit } from '@angular/core';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';
import { Observable, of } from 'rxjs';
import { AuthApiService } from '../../services/auth-api.service';

export interface Series {
  id: number;
  name: string;
  genre: string;
}

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  searchControl = new FormControl('');
  series: Series | null = null;
  isLoading = false;
  hasSearched = false;
  error: string | null = null;

  constructor(private authApiService: AuthApiService) { }

  ngOnInit(): void {
    this.searchControl.valueChanges.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(seriesName => {
        if (!seriesName || seriesName.trim() === '') {
          this.hasSearched = false;
          return of(null);
        }

        this.hasSearched = true;
        return this.fetchSeriesDetails(seriesName);
      })
    ).subscribe(result => {
      this.series = result;
      this.isLoading = false;
    });
  }

  async fetchSeriesDetails(seriesName: string): Promise<Series | null> {
    this.isLoading = true;  // Activa el indicador de carga
    this.error = null;  // Reinicia cualquier error previo
    this.series = null;  // Reinicia las series recomendadas

    try {
      // Llamar al servicio para obtener las recomendaciones
      const response = await this.authApiService.getRecommendedSeries(seriesName).toPromise();

      // Si la respuesta tiene éxito, devuelve el objeto Series
      if (response?.status === 'SUCCESS' && response.value) {
        const series = response.value;  // Aquí asumimos que 'value' contiene el nombre de las series recomendadas
        return { id: 1, name: series, genre: 'Mock Genre' };  // Ejemplo de retorno de la serie
      } else {
        this.error = 'No recommendations found.';  // Si no hay resultados, mostrar error
        return null;
      }
    } catch (err) {
      this.error = 'Failed to fetch series details. Please try again.';  // Manejo de errores
      return null;
    } finally {
      this.isLoading = false;  // Desactiva el indicador de carga
    }
  }

  onSearch(): void {
    const seriesName = this.searchControl.value;
    if (seriesName && seriesName.trim() !== '') {
      this.fetchSeriesDetails(seriesName);
    }
  }
}
