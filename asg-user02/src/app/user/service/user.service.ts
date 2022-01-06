import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { iUser } from '../user/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private base_url= "http://localhost:3000";

  http_option = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };
  constructor(private httpClient : HttpClient) { }
  getUsers() : Observable<iUser[]>{
    return this.httpClient.get<iUser[]>(this.base_url + "/users");
  }

}
