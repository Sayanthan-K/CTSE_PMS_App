const AnnouncementModel = require("../Model/AnnouncementModel");
const Info = require("../Utils/Info");
const Error = require("../Utils/Error");
exports.AddAnnouncement = (req, res) => {
  const outObject = {
    sucess: Boolean,
    info: "",
    error: "",
    data: {},
  };
  const { user_id, preschool_id, title, message } = req.body;
  const newAnnouncement = new AnnouncementModel({
    user_id,
    preschool_id,
    title,
    message,
  });

  newAnnouncement
    .save()
    .then((data) => {
      outObject.sucess = true;
      outObject.info = Info.CREATE_SUCESS;
      outObject.data = data._id;
      return res.status(200).json(outObject);
    })
    .catch((er) => {
      outObject.sucess = false;
      outObject.info = Error.CREATE_FAIL;
      return res.status(404).json(outObject);
    });
};
