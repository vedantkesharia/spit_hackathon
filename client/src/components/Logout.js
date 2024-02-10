import React from "react";
import { useLogout } from "../hooks/useLogout";

const Logout = () => {
  const { logout } = useLogout();

  const handleLogout = () => {
    logout();
  };

  return (
    <>
      <button onClick={handleLogout} className="border ">
        Logout
      </button>
    </>
  );
};

export default Logout;
