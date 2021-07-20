/*

path: api/users

*/

const { Router } = require("express");
const { renewToken } = require("../controllers/auth_controller");

const { validatorJWT } = require("../middlewares/jwt-validator");
const router = Router();

// validarJWT
router.get("/", validatorJWT, renewToken);

module.exports = router;
