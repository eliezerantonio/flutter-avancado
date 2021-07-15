const mongoose = require("mongoose");

const dbConnection = async () => {
  try {
    console.log("Init db config");
  } catch (error) {
    console.log(error);

    throw new Error("Erro na base de dados contacto o admin");
  }
};

module.exports = {
  dbConnection,
};
