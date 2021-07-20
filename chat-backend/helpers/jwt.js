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
        expiresIn: "24h",
      },
      (err, token) => {
        if (err) {
          // impossivel criar token

          reject("Nao foi possivel criar token de acesso");
        } else {
          ///criar token

          resolve(token);
        }
      }
    );
  });
};

const validateJWT = (token = "") => {
  try {
    const { uid } = jwt.verify(token, process.env.JWT_KEY);
    console.log(uid);
    return [true, uid];
  } catch (error) {
    console.log(error);
    return [false, null];
  }
};

module.exports = {
  generateJWT,
  validateJWT,
};
