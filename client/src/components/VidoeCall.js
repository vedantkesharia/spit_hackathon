import React, { useState, useCallback } from "react";
import { useNavigate } from "react-router-dom";

const VideoCall = () => {
  const [value, setValue] = useState();
  const navigate = useNavigate();

  const handleRoomJoin = useCallback(() => {
    navigate(`/room/${value}`);
  }, [navigate, value]);

  return (
    <div className="bg-blue flex w-full justify-center align-center flex-col ">
      <input
        type="text "
        placeholder="Enter Room Code"
        value={value}
        onChange={(e) => setValue(e.target.value)}
      ></input>
      <button onClick={handleRoomJoin}>Join</button>
    </div>
  );
};

export default VideoCall;
