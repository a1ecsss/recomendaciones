import { MatSnackBar } from '@angular/material/snack-bar';
import { Injectable } from '@angular/core';
import { HttpBackEndResponse } from '../models/httpResponse.model';

@Injectable({
  providedIn: 'root',
})
export class SnackBarService {

  constructor(private snackBar: MatSnackBar) {

  }

  public showMessage(result: HttpBackEndResponse<any>): void{
    if(result.status == 'SUCCESS'){
      this.succesSnackBar(result.message);
    }else if(result.status != 'SUCCESS'){
      this.errorSnackBar(result.message);
    }
  }

  public infoSnackBar(message: string): void {
    this.snackBar.open(message, '×', {
      panelClass: 'info',
      verticalPosition: 'top',
      duration: 3000,
    });
  }

  // Show success snackbar
  public succesSnackBar(message: string): void {
    this.snackBar.open(message, '×', {
      panelClass: 'success',
      verticalPosition: 'top',
      duration: 3500,
    });
  }

  // Show error snackbar
  public errorSnackBar(message: string): void {
    this.snackBar.open(message, '×', {
      panelClass: 'error',
      verticalPosition: 'top',
      duration: 3500,
    });
  }

}
