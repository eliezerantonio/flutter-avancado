/**
 * path :/apimessages
 */

const { Router } = require("express");

const { validatorJWT } = require("../middlewares/jwt-validator");

const { getMessages } = require("../controllers/messages_controller");

const router = Router();

router.get("/:from", validatorJWT, getMessages);

module.exports = router;
