/*

path: api/users

*/

const { Router } = require("express");

const { validatorJWT } = require("../middlewares/jwt-validator");
const router = Router();

// validarJWT
router.get("/", validatorJWT, renewToken);

module.exports = router;
