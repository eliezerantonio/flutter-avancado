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
const updateNotificationToken = async (req, res = response) => {
  const { id, token } = req.body;
 console.log(id, token)
  try {
    //revisar id

    let user = await User.findById(id );
    //reviar se o projecto existe

    if (!user) {
      return res.status(404).json({ mag: "user n econtrado" });
    }

    //atualizar
    user = await User.findOneAndUpdate(
      { _id: id },
      { $set: { notification_token: token } },
      { new: true }
    );

    // gerar jwt
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
  getUsers,
  updateNotificationToken
};
