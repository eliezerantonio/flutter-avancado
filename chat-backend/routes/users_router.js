/*

path: api/users

*/

const { Router } = require("express");
const { getUsers } = require("../controllers/users_controller");
const { updateNotificationToken } = require("../controllers/users_controller");

const { validatorJWT } = require("../middlewares/jwt-validator");
const router = Router();

// validarJWT
router.get("/", validatorJWT, getUsers);
router.put("/updateNotificationToken", updateNotificationToken);

module.exports = router;
