const { io } = require("../index");

//mesajes scokets
io.on("connect", (client) => {
  console.log("Cliente conectado");

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });

  client.on("broadcast", (payload) => {
    console.log("Mensagem!!!" + payload.name);

    io.emit("broadcast", { admin: "Nova mensagem" });
  });

  client.on("nova-mensagem", (payload) => {
    io.emit("nova-mensagem", "HEY!!!!!");
  });
});

//Mensajes de SocketS
