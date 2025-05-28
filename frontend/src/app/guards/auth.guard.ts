import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { SessionService } from '../services/session.service'; // Adjust the path

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private sessionService: SessionService, private router: Router) { }

  canActivate(): boolean {
    if (this.sessionService.currentUser) {
      // User is logged in, redirect to /home
      this.router.navigate(['/home']);
      return false; // Block the login or signup page
    }
    return true; // Allow access if no user is logged in
  }
}
