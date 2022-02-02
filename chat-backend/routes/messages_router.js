/**
 * path :/apimessages
 */

const { Router } = require("express");

const { validatorJWT } = require("../middlewares/jwt-validator");

const { getMessages } = require("../controllers/messages_controller");
const { deleteMessage } = require("../controllers/messages_controller");

const router = Router();

router.get("/:from", validatorJWT, getMessages);

router.delete("/:id", validatorJWT, deleteMessage);
module.exports = router;
