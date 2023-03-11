const Router = require("express").Router;
const router = Router();
const AnnouncementCtrl = require("../Controllers/AnnouncementCtrl");

router.route("/").post(AnnouncementCtrl.AddAnnouncement);

module.exports = router;
