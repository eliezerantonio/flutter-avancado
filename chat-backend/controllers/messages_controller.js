const { response } = require("express");

const Messages = require("../models/message");

const getMessages = async (req, res = response) => {
  try {
    const since = Number(req.query.since) || 0;
    const messages = await Messages.find()
      .sort("-online")
      .skip(since)
      .limit(20);

    if (!messages) {
      return res
        .status(404)
        .json({ ok: false, msg: "Nenhuma mensagem encontrado" });
    }

    res.json({
      ok: true,
      messages,
      since,
    });
  } catch (error) {}
};

module.exports = {
  getMessages,
};
