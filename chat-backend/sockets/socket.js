const { io } = require("../index");

// Messages de Sockets
io.on("connection", (client) => {
  console.log("Cliente conectado");

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });

  client.on("message", (payload) => {
    console.log("Messagem", payload);

    io.emit("message", { admin: "Nova Messagem" });
  });
});
