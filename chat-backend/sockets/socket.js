const { validateJWT } = require("../helpers/jwt");
const { io } = require("../index");

// Messages de Sockets
io.on("connection", (client) => {
  const [validate, uid] = validateJWT("x-token");

  if (!validate) {
    return client.disconnect();
  }

  console.log("Cliente conectado");

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });

  client.on("message", (payload) => {
    console.log("Messagem", payload);

    io.emit("message", { admin: "Nova Messagem" });
  });
});
