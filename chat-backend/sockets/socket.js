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

  client.on("disconnect", () => {
    console.log("Messagem", payload);
    userDesconnected(uid);
  });

  client.on("message", (payload) => {
    console.log("Messagem", payload);

    io.emit("message", { admin: "Nova Messagem" });
  });
});
