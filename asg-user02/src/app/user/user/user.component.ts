import { Component, OnInit } from '@angular/core';
import { iUser } from './user';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
   user : iUser = {id : 0, userName : " "};
  constructor() { }

  ngOnInit(): void {
  }

}
