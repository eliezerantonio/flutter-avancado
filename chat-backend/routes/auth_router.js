/*

path: api/login

*/

const { Router } = require("express");
const { check } = require("express-validator");
const {
  createUser,
  login,
  renewToken,
} = require("../controllers/auth_controller");
const { fieldsValidator } = require("../middlewares/fields-validators");
const { validatorJWT } = require("../middlewares/jwt-validator");
const router = Router();

router.post(
  "/new",
  [
    check("name", "`Nome `e obrigatorio").not().isEmpty(),
    check("email", "`E-mail `e obrigatorio").isEmail(),
    check("password", "`Senha `e obrigatoria").not().isEmpty(),
    fieldsValidator,
  ],
  createUser
);

//post: /
//validar e-mail e password

router.post("/", [
  check("email", "`E-mail `e obrigatorio").isEmail(),
  check("password", "`Senha `e obrigatoria").not().isEmpty(),

  fieldsValidator,
  login,
]);
// validarJWT
router.get("/renew", validatorJWT, renewToken);

module.exports = router;
