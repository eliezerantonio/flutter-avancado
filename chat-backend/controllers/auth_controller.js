const { response } = require("express");
const { validationResult } = require("express-validator");

const criarUsuario = (req, res = response) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({
      ok: false,
      errors: errors.mapped(),
    });
  }

  res.json({
    ok: true,
    msg: "Criar usuario!!!",
  });
};

module.exports = {
  criarUsuario,
};
