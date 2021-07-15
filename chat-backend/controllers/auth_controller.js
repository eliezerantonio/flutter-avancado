const { response } = require("express");
const criarUsuario = (req, res = response) => {
  res.json({
    ok: true,
    msg: "criar usuario!!!!",
  });
};

module.exports = {
  criarUsuario,
};
