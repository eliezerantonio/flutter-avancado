const { response } = require("express");

const User = require("../models/user");

const criarUsuario = async (req, res = response) => {
  const user = new User(req.body);

  await user.save();

  res.json({
    ok: true,
    msg: "Criar usuario!!!",
    body: req.body,
  });
};

module.exports = {
  criarUsuario,
};
