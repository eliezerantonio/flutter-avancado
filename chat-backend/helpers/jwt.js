const jwt = require("jsonwebtoken");

const generateJWT = (uid) => {
  return new Promise((resolve, reject) => {
    const payload = {
      uid,
    };

    jwt.sign(
      payload,
      process.env.JWT_KEY,
      {
        expires: "24h",
      },
      (err, token) => {
        if (err) {
          // impossivel criar token

          reject("Nao foi possivel criar token de acesso");
        } else {
          ///criar token
            
            resolve(token)
        }
      }
    );
  });
};

module.exports = {
  generateJWT,
};
