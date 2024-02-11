import Payment from "../models/Payments.js";

// Controller function to create a new payment
export const createPayment = async (req, res) => {
  try {
    // Extract data from request body
    const { email, cost } = req.body;

    // Create a new Payment instance
    const newPayment = new Payment({
      email,
      cost,
    });

    // Save the new payment record to the database
    await newPayment.save();

    // Respond with success message
    return res
      .status(201)
      .json({ message: "Payment created successfully", payment: newPayment });
  } catch (error) {
    // Handle errors
    console.error("Error creating payment:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};
