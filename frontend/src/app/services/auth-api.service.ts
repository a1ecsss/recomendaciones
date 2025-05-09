import { HttpResponse } from './../../models/httpResponse.model';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthApiService {

  private baseUrl = 'http://localhost:8080'; // La URL de tu endpoint

  constructor(private http: HttpClient) { }

  //funcion que hace la solicitud GET con el nombre de la serie
  getRecommendedSeries(name: string): Observable<HttpResponse<string>> {
    const encodedName = encodeURIComponent(name);  //codifica el parámetro 'name' para que en al url vaya bien y se reciba bien
    const url = `${this.baseUrl}/getRecommendedSeries?name=${encodedName}`;
    return this.http.get<HttpResponse<string>>(url);
  }
}
