const express = require("express");
const router = express.Router();

// Start Routes

router.get("/test", (req, res) => res.json({ msg: "This is the tweets route" }));

// End Routes

module.exports = router;