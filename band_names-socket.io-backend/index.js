const express = require("express");
require("dotenv").config();
const path = require("path");
//app do express
const app = express();
//Node Server configuration

const server = require("http").createServer(app);
const io = require("socket.io")(server);

//mesajes scokets
io.on("connection", (client) => {
  console.log("Cliente conectado");

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });
});

//Mensajes de SocketS

//puth public

const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));
server.listen(process.env.PORT, (err) => {
  if (err) throw new Error(err);

  console.log(`Servidor correndo na porta ` + process.env.PORT);
});
