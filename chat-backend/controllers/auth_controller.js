const { response } = require("express");
const bcrypt = require("bcryptjs");

const User = require("../models/user");
const { generateJWT } = require("../helpers/jwt");

const createUser = async (req, res = response) => {
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

    // gerar jwt
    const token = await generateJWT(user.id);
    res.json({
      ok: true,
      user,
      token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Contacte o administrador",
    });
  }
};

const login = (req, res) => {
  const { email, password } = req.body;

  try {
    const existEmail = await User.findOne({ email: email });

    if (!existEmail) {
      return res.status(400).json({ ok: false, msg: "Email nao encontrado" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Contacte o administrador",
    });
  }
};

module.exports = {
  createUser,
  login,
};
