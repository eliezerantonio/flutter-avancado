const { response } = require("express");

const User = require("../models/user");

const criarUsuario = async (req, res = response) => {
  const { email } = req.body;

  try {
    const existEmail = await User.findOne({ email: email });

    if (existEmail) {
      return res
        .status(400)
        .json({ ok: false, msg: "Correio ja esta registrado" });
    }

    const user = new User(req.body);
    await user.save();

    res.json({
      ok: true,
      user,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Contacte o administrador",
    });
  }
};

module.exports = {
  criarUsuario,
};
