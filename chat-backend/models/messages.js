const { Schema, model } = require("mongoose");

const MessageSchema = Schema(
  {
    from: {
      type: Schema.Type.ObjectId,
      ref: "User",
      required: true,
    },
    to: {
      type: Schema.Type.ObjectId,
      ref: "User",
      required: true,
    },
    message: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

UserSchema.method("toJSON", function () {
  const { __v, _id, ...object } = this.toObject();
  return object;
});

module.exports = model("Message", MessageSchema);
