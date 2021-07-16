const { response } = require("express");
const bcrypt = require("bcryptjs");

const User = require("../models/user");

const criarUsuario = async (req, res = response) => {
  const { email, password } = req.body;

  try {
    const existEmail = await User.findOne({ email: email });

    if (existEmail) {
      return res
        .status(400)
        .json({ ok: false, msg: "Correio ja esta registrado" });
    }

    const user = new User(req.body);
    //cripografar a senha
    const salt = bcrypt.genSaltSync();
    user.password = bcrypt.hashSync(password, salt);

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
