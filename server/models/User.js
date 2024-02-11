import mongoose from "mongoose";
import bcrypt from "bcrypt";

import validator from "validator";

const userSchema = new mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
      min: 2,
      max: 100,
    },
    email: {
      type: String,
      required: true,
      max: 50,
      unique: true,
    },
    password: {
      type: String,
      required: true,
      min: 5,
    },
    city: String,
    state: String,
    country: String,
    occupation: String,
    phoneNumber: String,
    transactions: Array,
    role: {
      type: String,
      enum: ["user", "admin", "superadmin"],
      
    },
  },
  { timestamps: true }
);

userSchema.statics.signup = async function (email, password, username,role) {
  //validation
  if (!email || !password) {
    throw error("All fields must be filled");
  }
  if (!validator.isEmail(email)) {
    throw error("Invalid email");
  }

  // if(!validator.isStrongPassword())

  const exists = await this.findOne({ email });
  if (exists) {
    throw error("Email already in use");
  }

  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);

  const user = await this.create({ email, password: hash, username,role });

  return user;
};

userSchema.statics.login = async function (email, password) {
  if (!email || !password) {
    throw error("All fields must be filled");
  }

  const user = await this.findOne({ email });
  if (!user) {
    throw error("Incorrect email");
  }

  const match = bcrypt.compare(password, user.password);
  if (!match) {
    throw error("Incorrect password");
  }

  return user;
};

const user  = mongoose.model("User", userSchema);
export default user