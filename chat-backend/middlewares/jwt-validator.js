const jwt = require("jsonwebtoken");

const validatorJWT = (req, res, next) => {
  //ler token
  const token = req.header("x-token");

  if (!token) {
    return res.status(401).json({
      ok: false,
      msg: "Nao existe nenhum token",
    });
  }

  try {
    //validar token
    const { uid } = jwt.verify(token, process.env.JWT_KEY);
    req.uid = uid;
    next();
  } catch (error) {
    return res.status(401).json({
      ok: false,
      msg: "Token invalido",
    });
  }
};

module.exports = {
  validatorJWT,
};
