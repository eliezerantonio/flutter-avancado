/*

path: api/login

*/

const { Router } = require("express");
const { check } = require("express-validator");
const { criarUsuario } = require("../controllers/auth_controller");
const { fieldsValidator } = require("../middlewares/fields-validators");
const router = Router();

router.post("/new", [fieldsValidator], criarUsuario);

module.exports = router;
