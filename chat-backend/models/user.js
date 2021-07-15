const { Schema, model } = require("mongoose");
const UserSchema = Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },

  online: {
    type: Boolean,
    default: false,
  },
});

module.exports = model("User", UserSchema);
