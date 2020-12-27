const mysql = require('mysql');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'Videogiochi_e_software'
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
  connection.query( req.body.query , function (err, result) {
    if (err) throw err;
    console.log(result);
    res.render("result", {data:result});
  });
});

app.get("/", (req, res) => {
  res.render("index");
});