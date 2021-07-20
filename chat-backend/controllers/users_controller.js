const { response } = require("express");
const User = require("../models/user");

const getUsers = async (req, res = response) => {
  try {
    const since = Number(req.query.since) || 0;
    const users = await User.find({ _id: { $ne: req.uid } })
      .sort("-online")
      .skip(since)
      .limit(20);

    if (!users) {
      return res
        .status(404)
        .json({ ok: false, msg: "Nenhum usuario encontrado" });
    }

    res.json({
      ok: true,
      users,
      since,
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getUsers,
};
