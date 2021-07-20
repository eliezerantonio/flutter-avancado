const { validateJWT } = require("../helpers/jwt");
const { io } = require("../index");
const {
  userConnected,
  userDesconnected,
} = require("../controllers/socket_controller");

// Messages de Sockets
io.on("connection", (client) => {
  const [validate, uid] = validateJWT(client.handshake.headers["x-token"]);
  if (!validate) {
    return client.disconnect();
  }

  userConnected(uid);

  //emcaminhar usuario a uma sala especifica
  //sala global, client.idio

  client.join(uid);
  // client.to(uid).emit('')

  client.on("disconnect", () => {
    console.log("Messagem");
    userDesconnected(uid);
  });

  client.on("message", (payload) => {
    console.log("Messagem", payload);

    io.emit("message", { admin: "Nova Messagem" });
  });
});
