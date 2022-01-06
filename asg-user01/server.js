const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors');

const cors_option = {origin : "http://localhost:4200", optionSuccessStatus : 200};

const USERS= [
    {id : 1, userName: "Shweta"},
    {id : 2, userName: "Shardul"},
    {id : 3, userName: "Sumeet"}

]
server.use(express.json());
server.use(express.urlencoded({extended : true}));
server.use(cors(cors_option));

server.get('/',(req, resp)=>{
    resp.send("Express is working");
})
server.get('/users', (req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    resp.send(USERS);
})

server.listen(port,()=>{
    console.log("http://localhost:3000 started")
})