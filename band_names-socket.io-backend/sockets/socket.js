const { io } = require("../index");

//mesajes scokets
io.on("connection", (client) => {
  console.log("Cliente conectado");

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });

  client.on("broadcast", (payload) => {
    console.log("Mensagem!!!" + payload.name);

    io.emit("broadcast", { admin: "Nova mensagem" });
  });
});

//Mensajes de SocketS
