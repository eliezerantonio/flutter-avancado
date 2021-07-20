const { response } = require("express");
const User = require("../models/user");
const getUsers = async (req, res = response) => {
  const since = Number(req.query.since || 0);
  const users = await User.find({ _id: { $ne: req.uid } })
    .sort("-online")
    .skip(since).limit(20);

  if (!users) {
    return res
      .status(404)
      .json({ ok: false, msg: "Nenhum usuario encontrado" });
  }

  return {
    ok: true,
    users,
    since,
  };
};

module.exports = {
  getUsers,
};
