import express from "express";

import {createPayment} from "../controllers/paymentcreate.js";

const router = express.Router();

//signup route
router.post("/pay", createPayment);

export default router;
