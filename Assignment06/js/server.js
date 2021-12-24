const express=require('express');
const app=express();
const port =3000;
app.get('/',(req,resp)=>{
    resp.send("CALLED : Get");
})
app.post('/index.html',(req,resp)=>{
    resp.sendFile("CALLED : POST");
});
app.put('/index.html',(req,resp)=>{
    resp.sendFile("CALLED : PUT");
});
app.delete('/index.html',(req,resp)=>{
    resp.sendFile("CALLED : DELETE");
});

app.listen(port,()=>{
    console.log(`http://localhost:${port} Express server started `);
})
