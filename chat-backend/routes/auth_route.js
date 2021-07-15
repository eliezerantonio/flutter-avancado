/*

path: api/login

*/
const { criarUsuario } = require("../controllers/auth_controller");
const { Router } = require("express");
const router = Router();

router.post("/new", criarUsuario);

module.exports = router;
