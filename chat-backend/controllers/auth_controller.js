const { response } = require("express");

const criarUsuario = (req, res = response) => {
  res.json({
    ok: true,
    msg: "Criar usuario!!!",
  });
};

module.exports = {
  criarUsuario,
};
