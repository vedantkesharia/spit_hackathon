import mongoose from "mongoose";

const PaymentsSchema = new mongoose.Schema(
  {
    email: String,
    cost: String,
  },
  { timestamps: true }
);

const Payment = mongoose.model("Payment", PaymentsSchema);
export default Payment;
