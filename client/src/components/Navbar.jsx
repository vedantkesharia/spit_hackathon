import React, { useState, useEffect } from "react";
import {
  LightModeOutlined,
  DarkModeOutlined,
  Menu as MenuIcon,
  Search,
  SettingsOutlined,
  ArrowDropDownOutlined,
} from "@mui/icons-material";
import NotificationsIcon from "@mui/icons-material/Notifications";
import FlexBetween from "components/FlexBetween";
import { useDispatch } from "react-redux";
import { setMode } from "state";
import profileImage from "assets/profile.jpeg";
import {
  AppBar,
  Button,
  Box,
  Typography,
  IconButton,
  InputBase,
  Toolbar,
  Menu,
  MenuItem,
  useTheme,
  Snackbar,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Slide,
} from "@mui/material";
import Logout from "./Logout";

// Transition for the custom dialog box
const Transition = React.forwardRef(function Transition(
  props,
  ref
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

const Navbar = ({ user, isSidebarOpen, setIsSidebarOpen }) => {
  const dispatch = useDispatch();
  const theme = useTheme();

  const [anchorEl, setAnchorEl] = useState(null);
  const [notificationOpen, setNotificationOpen] = useState(false); // State to manage notifications
  const [dialogOpen, setDialogOpen] = useState(false); // State to manage custom dialog
  const isOpen = Boolean(anchorEl);
  const handleClick = (event) => setAnchorEl(event.currentTarget);
  const handleClose = () => setAnchorEl(null);
  const user2 = localStorage.getItem("user");
  const parsedUser = JSON.parse(user2);

  const handleNotificationClick = () => {
    // Open notifications when the notifications icon is clicked
    setNotificationOpen(true);
    setDialogOpen(true); // Open custom dialog
  };

  const handleNotificationClose = () => {
    // Close notifications
    setNotificationOpen(false);
  };

  const handleDialogClose = () => {
    setDialogOpen(false); // Close custom dialog
  };

  return (
    <AppBar
      sx={{
        position: "static",
        background: "none",
        boxShadow: "none",
      }}
    >
      <Toolbar sx={{ justifyContent: "space-between" }}>
        {/* LEFT SIDE */}
        <FlexBetween>
          <IconButton onClick={() => setIsSidebarOpen(!isSidebarOpen)}>
            <MenuIcon />
          </IconButton>
          <FlexBetween
            backgroundColor={theme.palette.background.alt}
            borderRadius="9px"
            gap="3rem"
            p="0.1rem 1.5rem"
          >
            <InputBase placeholder="Search..." />
            <IconButton>
              <Search />
            </IconButton>
          </FlexBetween>
        </FlexBetween>

        {/* RIGHT SIDE */}
        <FlexBetween gap="1.5rem">
          <IconButton onClick={() => dispatch(setMode())}>
            {theme.palette.mode === "dark" ? (
              <DarkModeOutlined sx={{ fontSize: "25px" }} />
            ) : (
              <LightModeOutlined sx={{ fontSize: "25px" }} />
            )}
          </IconButton>
          {/* <IconButton>
            <SettingsOutlined sx={{ fontSize: "25px" }} />
          </IconButton> */}
          <IconButton onClick={handleNotificationClick}>
            <NotificationsIcon sx={{ fontSize: "25px" }} />
          </IconButton>

          <FlexBetween>
            <Button
              onClick={handleClick}
              sx={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                textTransform: "none",
                gap: "1rem",
              }}
            >
              {/* <Box
                component="img"
                alt="profile"
                src={profileImage}
                height="32px"
                width="32px"
                borderRadius="50%"
                sx={{ objectFit: "cover" }}
              /> */}
              <Box textAlign="left">
                <Typography
                  fontWeight="bold"
                  fontSize="0.85rem"
                  sx={{ color: theme.palette.secondary[100] }}
                >
                  {parsedUser.email}
                </Typography>
                {/* <Typography
                  fontSize="0.75rem"
                  sx={{ color: theme.palette.secondary[200] }}
                >
                  Farmer
                </Typography> */}
              </Box>
              <ArrowDropDownOutlined
                sx={{ color: theme.palette.secondary[300], fontSize: "25px" }}
              />
            </Button>
            <Menu
              anchorEl={anchorEl}
              open={isOpen}
              onClose={handleClose}
              anchorOrigin={{ vertical: "bottom", horizontal: "center" }}
            >
              <MenuItem onClick={handleClose}>
                <Logout></Logout>
              </MenuItem>
            </Menu>
          </FlexBetween>
        </FlexBetween>
      </Toolbar>

      {/* Notification Snackbar */}
      <Snackbar
        open={notificationOpen}
        autoHideDuration={6000}
        onClose={handleNotificationClose}
        message="You have new notifications!"
      />

      {/* Custom Dialog for notifications */}
      <Dialog
        open={dialogOpen}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleDialogClose}
        aria-labelledby="dialog-title"
      >
        <DialogTitle id="dialog-title">New Notifications</DialogTitle>
        <DialogContent>
          {/* Display your notifications here */}
          <Typography>Payment Due on 15-02-24</Typography>
          <Typography>Amount To Be Paid: 1000Rs</Typography>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleDialogClose}>Close</Button>
        </DialogActions>
      </Dialog>
    </AppBar>
  );
};

export default Navbar;


// import React, { useState, useEffect } from "react";
// import {
//   LightModeOutlined,
//   DarkModeOutlined,
//   Menu as MenuIcon,
//   Search,
//   SettingsOutlined,
//   ArrowDropDownOutlined,
// } from "@mui/icons-material";
// import NotificationsIcon from '@mui/icons-material/Notifications';
// import FlexBetween from "components/FlexBetween";
// import { useDispatch } from "react-redux";
// import { setMode } from "state";
// import profileImage from "assets/profile.jpeg";
// import {
//   AppBar,
//   Button,
//   Box,
//   Typography,
//   IconButton,
//   InputBase,
//   Toolbar,
//   Menu,
//   MenuItem,
//   useTheme,
// } from "@mui/material";
// import Logout from "./Logout"

// const Navbar = ({ user, isSidebarOpen, setIsSidebarOpen }) => {
//   const dispatch = useDispatch();
//   const theme = useTheme();

//   const [anchorEl, setAnchorEl] = useState(null);
//   const isOpen = Boolean(anchorEl);
//   const handleClick = (event) => setAnchorEl(event.currentTarget);
//   const handleClose = () => setAnchorEl(null);
//   const user2 = localStorage.getItem("user");
//   const parsedUser = JSON.parse(user2);

//   return (
//     <AppBar
//       sx={{
//         position: "static",
//         background: "none",
//         boxShadow: "none",
//       }}
//     >
//       <Toolbar sx={{ justifyContent: "space-between" }}>
//         {/* LEFT SIDE */}
//         <FlexBetween>
//           <IconButton onClick={() => setIsSidebarOpen(!isSidebarOpen)}>
//             <MenuIcon />
//           </IconButton>
//           <FlexBetween
//             backgroundColor={theme.palette.background.alt}
//             borderRadius="9px"
//             gap="3rem"
//             p="0.1rem 1.5rem"
//           >
//             <InputBase placeholder="Search..." />
//             <IconButton>
//               <Search />
//             </IconButton>
//           </FlexBetween>
//         </FlexBetween>

//         {/* RIGHT SIDE */}
//         <FlexBetween gap="1.5rem">
//           <IconButton onClick={() => dispatch(setMode())}>
//             {theme.palette.mode === "dark" ? (
//               <DarkModeOutlined sx={{ fontSize: "25px" }} />
//             ) : (
//               <LightModeOutlined sx={{ fontSize: "25px" }} />
//             )}
//           </IconButton>
//           {/* <IconButton>
//             <SettingsOutlined sx={{ fontSize: "25px" }} />
//           </IconButton> */}
//           <IconButton>
//             <NotificationsIcon sx={{ fontSize: "25px" }} />
//           </IconButton>

//           <FlexBetween>
//             <Button
//               onClick={handleClick}
//               sx={{
//                 display: "flex",
//                 justifyContent: "space-between",
//                 alignItems: "center",
//                 textTransform: "none",
//                 gap: "1rem",
//               }}
//             >
//               <Box
//                 component="img"
//                 alt="profile"
//                 src={profileImage}
//                 height="32px"
//                 width="32px"
//                 borderRadius="50%"
//                 sx={{ objectFit: "cover" }}
//               />
//               <Box textAlign="left">
//                 <Typography
//                   fontWeight="bold"
//                   fontSize="0.85rem"
//                   sx={{ color: theme.palette.secondary[100] }}
//                 >
//                   {parsedUser.email}
//                 </Typography>
//                 <Typography
//                   fontSize="0.75rem"
//                   sx={{ color: theme.palette.secondary[200] }}
//                 >
//                   Farmer
//                 </Typography>
//               </Box>
//               <ArrowDropDownOutlined
//                 sx={{ color: theme.palette.secondary[300], fontSize: "25px" }}
//               />
//             </Button>
//             <Menu
//               anchorEl={anchorEl}
//               open={isOpen}
//               onClose={handleClose}
//               anchorOrigin={{ vertical: "bottom", horizontal: "center" }}
//             >
//               <MenuItem onClick={handleClose}><Logout></Logout></MenuItem>
//             </Menu>
//           </FlexBetween>
//         </FlexBetween>
//       </Toolbar>
//     </AppBar>
//   );
// };

// export default Navbar;
