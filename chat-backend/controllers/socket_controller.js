const User = require("../models/user");

const userConnected = async (uid = "") => {
  const user = await User.findById(uid);

  user.online = true;
  await user.save();
  return user;
};

const userDesconnected = async (uid = "") => {
  const user = await User.findById(uid);
  user.online = false;
  await user.save();
  return user;
};

module.exports = {
  userConnected,
  userDesconnected,
};
