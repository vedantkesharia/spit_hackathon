import { useState } from "react";

export const usePay = () => {
  const pay = async (email, cost) => {
    const response = await fetch("http://localhost:4000/pay", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, cost }),
    });
    const json = await response.json();
  };

  return { pay };
};
