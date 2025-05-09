import { Component, OnInit } from '@angular/core';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';
import { Observable, of } from 'rxjs';

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
    this.isLoading = true;
    this.error = null;

    try {
      // Simulate API call with a delay
      // Replace this with your actual API endpoint later
      await new Promise(resolve => setTimeout(resolve, 1500));

      // Mock data for demonstration
      if (seriesName.toLowerCase() === 'stranger things') {
        return {
          id: 1,
          name: 'Stranger Things',
          genre: 'Sci-Fi/Horror'
        };
      } else if (seriesName.toLowerCase() === 'breaking bad') {
        return {
          id: 2,
          name: 'Breaking Bad',
          genre: 'Drama/Crime'
        };
      } else if (seriesName.toLowerCase() === 'the crown') {
        return {
          id: 3,
          name: 'The Crown',
          genre: 'Historical Drama'
        };
      }

      // No results found
      return null;
    } catch (err) {
      this.error = 'Failed to fetch series details. Please try again.';
      return null;
    }
  }

  onSearch(): void {
    const seriesName = this.searchControl.value;
    if (seriesName && seriesName.trim() !== '') {
      this.fetchSeriesDetails(seriesName);
    }
  }
}
