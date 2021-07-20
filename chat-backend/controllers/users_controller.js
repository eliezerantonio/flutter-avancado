const { response } = require("express");
const User = require("../models/user");
const getUsers = async (req, res = response) => {
  const users = await User.findAll();

  if (!users) {
    return res
      .status(404)
      .json({ ok: false, msg: "Nenhum usuario encontrado" });
  }

  return {
    ok: true,
    users,
  };
};
