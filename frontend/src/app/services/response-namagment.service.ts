import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { map } from 'rxjs/operators';
import { firstValueFrom, of } from 'rxjs';
import { HttpBackEndResponse } from '../models/httpResponse.model';

@Injectable({
  providedIn: 'root',
})
export class ResponseService {
  apiUrl: string = 'http://localhost:8080';

  constructor(private http: HttpClient) {}


  async manageAnswerGet<T>(
    urlParam: string,
    credentials: { [key: string]: any }, // Las credenciales como objeto
    ): Promise<HttpBackEndResponse<T>> {
    let url = `${this.apiUrl}/${urlParam}`;
    const entries = Object.entries(credentials);
    if (entries.length > 0) {
        url += '?';
    }
    let first = true;
    for (const [key, value] of entries) {
      if (value !== undefined && value !== null && value !== "") {
        // Si es el primer parámetro, no añadir '&'
        url += `${first ? '' : '&'}${key}=${encodeURIComponent(value)}`;
        first = false;
      }
    }
    return firstValueFrom(
      this.http.get<any>(url).pipe(
        map((response) => {
          return response;
        }),
        catchError((error) => {
          console.error('Error inesperado:', error);
          throw new Error('Error inesperado al hacer la solicitud GET.');
        })
      )
    );
  }

  // Método POST con tipo fuerte
  async manageAnswerPost<D, T>( // D: datos enviados, T: datos recibidos
    endPoint: string,
    data: D
  ): Promise<HttpBackEndResponse<T>> {
    const url = `${this.apiUrl}/${endPoint}`;
    return firstValueFrom(
      this.http.post<HttpBackEndResponse<T>>(url, data, { responseType: 'json' }).pipe(
        map((response) => response),
        catchError((error) => {
          console.error('Error inesperado:', error);
          throw new Error('Error inesperado al hacer la solicitud POST.');
        })
      )
    );
  }

  // Método PUT con tipo fuerte
  async manageAnswerPut<D, T>(
    endPoint: string,
    data: D
  ): Promise<HttpBackEndResponse<T>> {
    const url = `${this.apiUrl}/${endPoint}`;
    return firstValueFrom(
      this.http.put<HttpBackEndResponse<T>>(url, data, { responseType: 'json' }).pipe(
        map((response) => response),
        catchError((error) => {
          console.error('Error inesperado:', error);
          throw new Error('Error inesperado al hacer la solicitud PUT.');
        })
      )
    );
  }

}
