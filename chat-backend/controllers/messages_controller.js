const { response } = require("express");

const Messages = require("../models/message");

const getMessages = async (req, res = response) => {
  try {
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
      messages: last30,
    });
  } catch (error) {}
};

const deleteMessage = async (req, res = response) => {
 
  try {
   
    
   
  await Messages.findByIdAndRemove({ _id: req.params.id ,});
  res.json({ msg: "Sms eliminada" });
  
 } catch (error) {
   
 }
}

module.exports = {
  getMessages,
  deleteMessage
};
