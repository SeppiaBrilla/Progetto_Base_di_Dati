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

const {
  json
} = require("body-parser");
var app = express();

app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

app.listen(8000, () => {
  console.log('Listening on: https://localhost:8000/')
});
app.get("/", (req, res) => {
  connection.query( "SELECT * FROM Prodotto" , function (err, result) {
    if (err) throw err;
    res.render("result", {data:result});
  });
});