const express = require("express");
const path = require("path");

require("dotenv").config();

//DB configuration

require("./database/config").dbConnection();

// App de Express
const app = express();

//Leitura e conversao do corpo da requisicao
app.use(express.json());

// Node Server
const server = require("http").createServer(app);
module.exports.io = require("socket.io")(server);
require("./sockets/socket");

// Path público
const publicPath = path.resolve(__dirname, "public");
app.use(express.static(publicPath));

//minhas rotas
app.use("/api/login", require("./routes/auth_router"));
app.use("/api/users", require("./routes/users_router"));
app.use("/api/messages", require("./routes/messages_router"));

server.listen(process.env.PORT, (err) => {
  if (err) throw new Error(err);

  console.log("Servidor corrento na porta", process.env.PORT);
});
