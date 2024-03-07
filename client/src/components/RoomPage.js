import React, { useState, useCallback } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { ZegoUIKitPrebuilt } from "@zegocloud/zego-uikit-prebuilt";

const RoomPage = () => {
  const { roomId } = useParams();

  const myMeeting = async (element) => {
    const appId = 864288262;
    const serverSecret = "b44d00336485cc6cc91359db2817d358";
    const kittoken = ZegoUIKitPrebuilt.generateKitTokenForTest(
      appId,
      serverSecret,
      roomId,
      Date.now().toString(),
      "username"
    );
    const zc = ZegoUIKitPrebuilt.create(kittoken);
    zc.joinRoom({
      container: element,
      scenario: {
        mode: ZegoUIKitPrebuilt.OneONoneCall,
      },
      showScreenSharingButton: true,
      sharedLinks: [
        {
          name: "Copy link",
          url: `http://localhost:3000/room/${roomId}`,
        },
      ],
    });
  };
  return (
    <div>
      <div ref={myMeeting}></div>
    </div>
  );
};

export default RoomPage;
