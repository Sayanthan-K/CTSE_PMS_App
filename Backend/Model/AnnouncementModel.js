const mongoose = require("mongoose");

const announcementSchema = new mongoose.Schema(
  {
    user_id: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Users",
    },
    preschool_id: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Preschool",
    },
    title: {
      type: String,
      required: true,
      trim: true,
    },
    message: {
      type: String,
      required: true,
      trim: true,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("announcement", announcementSchema);
