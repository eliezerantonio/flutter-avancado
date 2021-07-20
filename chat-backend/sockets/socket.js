const { validateJWT } = require("../helpers/jwt");
const { io } = require("../index");
const {
  userConnected,
  userDisconnected,
} = require("../controllers/socket_controller");

// Messages de Sockets
io.on("connection", async (client) => {
  const [validate, uid] = validateJWT("x-token");
  console.log(uid);
  if (!validate) {
    return client.disconnect();
  }

  await userConnected(uid);

  client.on("disconnect", async () => {
    await userDisconnected(uid);
  });

  client.on("message", (payload) => {
    console.log("Messagem", payload);

    io.emit("message", { admin: "Nova Messagem" });
  });
});
