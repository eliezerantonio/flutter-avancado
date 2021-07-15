/*

path: api/login

*/

const { Router } = require("express");
const { check } = require("express-validator");
const { criarUsuario } = require("../controllers/auth_controller");
const router = Router();

router.post(
  "/new",
  [check("nome", "O nome `e obrigatorio").not().isEmpty()],
  criarUsuario
);

module.exports = router;
