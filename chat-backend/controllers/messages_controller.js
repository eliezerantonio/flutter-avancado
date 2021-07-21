const { response } = require("express");

const Messages = require("../models/message");

const getMessages = async (req, res = response) => {
  try {
    const since = Number(req.query.since) || 0;
    const miId = req.uid;
    const messagesFrom = req.params.from;
    const last30 = await Messages.find({
      $or: [
        { from: miId, to: messagesFrom },
        { from: messagesFrom, to: miId },
      ],
    })
      .sort({ createdAt: "desc" })
      .limit(30);

    if (!last30) {
      return res
        .status(404)
        .json({ ok: false, msg: "Nenhuma mensagem encontrado" });
    }

    res.json({
      ok: true,
      last30,
    });
  } catch (error) {}
};

module.exports = {
  getMessages,
};
