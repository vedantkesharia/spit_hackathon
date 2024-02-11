import User from "../models/User.js";
import jwt from "jsonwebtoken";

const createToken = (_id) => {
  return jwt.sign({ _id }, process.env.SECRET_KEY, { expiresIn: "3d" });
};

//login

export const loginUser = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.login(email, password);
    console.log(user)
    const role= user.role;
    const token = createToken(user._id);
    res.status(200).json({ email, token, role});
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

//signup

export const signupUser = async (req, res) => {
  const { email, password, username,role } = req.body;
  try {
    const user = await User.signup(email, password, username,role);
    const token = createToken(user._id);
    res.status(200).json({ email, token,role });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
  res.json({ mssg: "signup user" });
};


