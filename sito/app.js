const mysql = require('mysql');
const connection = mysql.createConnection({
  host: 'golem.cs.unibo.it',
  user: 'my2004',
  password: 'Eed2ohth',
  database: 'my2004'
});
connection.connect((err) => {
  if (err) throw err;
  console.log('Connected!');
});

const express = require("express");

var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

app.listen(8000, () => {
  console.log('Listening on: https://localhost:8000/')
});
app.post("/query", (req, res) => {
  try {
    if(req.body.query.includes("INSERT") || req.body.query.includes("UPDATE")){
      let commands = req.body.query.split(";");
      for(let i = 0; i<commands.length-1; i++){
        connection.query(commands[i]+";" , function (err, result) {
        //if (err) throw err;
        })
      }
      res.render("result", {data:"NO", query: req.body.query});
    }else{
      connection.query(req.body.query , function (err, result) {
        //if (err) throw err;
        console.log(result);
        res.render("result", {data:result, query: req.body.query});
      });
    }
  } catch (error) {
    res.render("result", {data:"NO", query: req.body.error});
  }
});

app.get("/", (req, res) => {
  res.render("index");
});