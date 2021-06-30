const express = require("express");
const app = express();
require("dotenv").config();

const path = require("path");

//puth public

const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));
app.listen(process.env.PORT, (err) => {
  if (err) throw new Error(err);

  console.log(`Servidor correndo na porta ` + process.env.PORT);
});
