const jwt = require("jsonwebtoken");

const generateJWT = (uid) => {
  const payload = {
    uid,
  };
    
    jwt.sign(payload,)
};

module.exports = {
  generateJWT,
};
