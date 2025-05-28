import { Injectable } from '@angular/core';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class SessionService {
  private readonly storageKey = 'currentUser';
  public currentUser: User | null = null;

  constructor() {
    this.loadUserFromStorage();
  }

  private loadUserFromStorage(): void {
    const storedUser = localStorage.getItem(this.storageKey);
    if (storedUser) {
      this.currentUser = JSON.parse(storedUser) as User;
    }
  }

  public setUser(user: User): void {
    this.currentUser = user;
    localStorage.setItem(this.storageKey, JSON.stringify(user));
  }

  public clearUser(): void {
    this.currentUser = null;
    localStorage.removeItem(this.storageKey);
  }

  public getCurrentUser(): User | null {
    return this.currentUser;
  }
}
