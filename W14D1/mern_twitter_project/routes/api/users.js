const express = require("express");
const router = express.Router();

// Start Routes

router.get("/test", (req, res) => res.json({ msg: "This is the users route" }));

// End Routes

module.exports = router;