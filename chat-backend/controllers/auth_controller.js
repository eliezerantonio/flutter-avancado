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

const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const userDB = await User.findOne({ email: email });

    if (!userDB) {
      return res.status(404).json({ ok: false, msg: "Email nao encontrado" });
    }

    //validar Senha
    const validPassword = bcrypt.compareSync(password, userDB.password);
    if (!validPassword) {
      return res.status(400).json({
        ok: false,
        msg: "Senhas nao coecidem",
      });
    }

    // Generar el JWT
    const token = await generateJWT(userDB.id);

    res.json({
      ok: true,
      user: userDB,
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

const renewToken = async (req, res = response) => {
  const uid = req.uid;
  const token = await generateJWT(uid);

  const user = await User.findById(uid);

  res.json({
    ok: false,
    user,
    token,
  });
};

module.exports = {
  createUser,
  login,
  renewToken,
};
