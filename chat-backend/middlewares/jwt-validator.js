const jwt = require("jsonwebtoken");

const validatorJWT = (req, res, next) => {
  //ler token
  const token = req.header("x-token");

  console.log(token);

  next();
};

module.exports = {
  validatorJWT,
};
