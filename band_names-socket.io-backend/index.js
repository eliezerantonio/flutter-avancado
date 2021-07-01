const express = require("express");
require("dotenv").config();
const path = require("path");
//app do express
const app = express();
//Node Server configuration

const server = require("http").createServer(app);
module.exports.io = require("socket.io")(server);
require("./sockets/socket");

//puth public

const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));
server.listen(process.env.PORT, (err) => {
  if (err) throw new Error(err);

  console.log(`Servidor correndo na porta ` + process.env.PORT);
});
