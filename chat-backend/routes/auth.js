/*

path: ??

*/

const { Router, response } = require("express");

const router = Router();

router.post("/new", (req, res = response) => {
  res.json({
    ok: true,
    msg: "criar usuario",
  });
});

module.exports = router;
