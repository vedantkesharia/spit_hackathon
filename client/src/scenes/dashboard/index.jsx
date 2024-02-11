import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import DashboardFarmer from "./dashboard_farmer";
import DashboardAdmin from "./dashboard_admin";

const Dashboard = () => {
  const navigate = useNavigate();
  const [userRole, setUserRole] = useState(null);

  useEffect(() => {
    // Fetch user role from localStorage
    const user = localStorage.getItem("user");
    if (user) {
      const parsedUser = JSON.parse(user);
      setUserRole(parsedUser.role);
      console.log(parsedUser.role);
    } else {
      // Handle case where user is not logged in
      navigate("/login"); // Redirect to login page
    }
  }, [navigate]);

  // Render appropriate dashboard based on user role
  return (
    <>
      {userRole === "user" && <DashboardFarmer />}
      {userRole === "admin" && <DashboardAdmin />}
    </>
  );
};

export default Dashboard;











// import React from "react";
// import FlexBetween from "components/FlexBetween";
// import Header from "components/Header";
// import {
//   DownloadOutlined,
//   Email,
//   PointOfSale,
//   PersonAdd,
//   Traffic,
// } from "@mui/icons-material";
// import {
//   Box,
//   Button,
//   Typography,
//   useTheme,
//   useMediaQuery,
// } from "@mui/material";
// import { DataGrid } from "@mui/x-data-grid";
// import BreakdownChart from "components/BreakdownChart";
// import OverviewChart from "components/OverviewChart";
// import { useGetDashboardQuery } from "state/api";
// import StatBox from "components/StatBox";
// import Crispjs from "components/Crisp";
// import { useNavigate } from "react-router-dom";
// const Dashboard = () => {
//   const theme = useTheme();
//   const isNonMediumScreens = useMediaQuery("(min-width: 1200px)");
//   const { data, isLoading } = useGetDashboardQuery();
//   const navigate = useNavigate()

//   const columns = [
//     {
//       field: "_id",
//       headerName: "ID",
//       flex: 1,
//     },
//     {
//       field: "userId",
//       headerName: "User ID",
//       flex: 1,
//     },
//     {
//       field: "createdAt",
//       headerName: "CreatedAt",
//       flex: 1,
//     },
//     {
//       field: "products",
//       headerName: "# of Products",
//       flex: 0.5,
//       sortable: false,
//       renderCell: (params) => params.value.length,
//     },
//     {
//       field: "cost",
//       headerName: "Cost",
//       flex: 1,
//       renderCell: (params) => `$${Number(params.value).toFixed(2)}`,
//     },
//   ];

//   return (
//     <>
//     <Crispjs/>
//     <Box m="1.5rem 2.5rem">
//       <FlexBetween>
//         <Header title="DASHBOARD" subtitle="Welcome to your dashboard" />

//         <Box>
//           <Button
//             sx={{
//               backgroundColor: theme.palette.secondary.light,
//               color: theme.palette.background.alt,
//               fontSize: "14px",
//               fontWeight: "bold",
//               padding: "10px 20px",
//             }}

//             onClick={()=>{
//               navigate("/form")
//             }}
//           >
//             {/* <DownloadOutlined sx={{ mr: "10px" }} /> */}
//             Check CIBIL Score
//           </Button>
//         </Box>
//       </FlexBetween>

//       <Box
//         mt="20px"
//         display="grid"
//         gridTemplateColumns="repeat(12, 1fr)"
//         gridAutoRows="160px"
//         gap="20px"
//         sx={{
//           "& > div": { gridColumn: isNonMediumScreens ? undefined : "span 12" },
//         }}
//       >
//         {/* ROW 1 */}
//         <StatBox
//           title="Total Customers"
//           value={data && data.totalCustomers}
//           increase="+14%"
//           description="Since last month"
//           icon={
//             <Email
//               sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
//             />
//           }
//         />
//         <StatBox
//           title="Sales Today"
//           value={data && data.todayStats.totalSales}
//           increase="+21%"
//           description="Since last month"
//           icon={
//             <PointOfSale
//               sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
//             />
//           }
//         />
//         <Box
//           gridColumn="span 8"
//           gridRow="span 2"
//           backgroundColor={theme.palette.background.alt}
//           p="1rem"
//           borderRadius="0.55rem"
//         >
//           <OverviewChart view="sales" isDashboard={true} />
//         </Box>
//         <StatBox
//           title="Monthly Sales"
//           value={data && data.thisMonthStats.totalSales}
//           increase="+5%"
//           description="Since last month"
//           icon={
//             <PersonAdd
//               sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
//             />
//           }
//         />
//         <StatBox
//           title="Yearly Sales"
//           value={data && data.yearlySalesTotal}
//           increase="+43%"
//           description="Since last month"
//           icon={
//             <Traffic
//               sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
//             />
//           }
//         />

//         {/* ROW 2 */}
//         <Box
//           gridColumn="span 7"
//           gridRow="span 3"
//           sx={{
//             "& .MuiDataGrid-root": {
//               border: "none",
//               borderRadius: "5rem",
//             },
//             "& .MuiDataGrid-cell": {
//               borderBottom: "none",
//             },
//             "& .MuiDataGrid-columnHeaders": {
//               backgroundColor: theme.palette.background.alt,
//               color: theme.palette.secondary[100],
//               borderBottom: "none",
//             },
//             "& .MuiDataGrid-virtualScroller": {
//               backgroundColor: theme.palette.background.alt,
//             },
//             "& .MuiDataGrid-footerContainer": {
//               backgroundColor: theme.palette.background.alt,
//               color: theme.palette.secondary[100],
//               borderTop: "none",
//             },
//             "& .MuiDataGrid-toolbarContainer .MuiButton-text": {
//               color: `${theme.palette.secondary[200]} !important`,
//             },
//           }}
//         >
//           <DataGrid
//             loading={isLoading || !data}
//             getRowId={(row) => row._id}
//             rows={(data && data.transactions) || []}
//             columns={columns}
//           />
//         </Box>
//         <Box
//           gridColumn="span 5"
//           gridRow="span 3"
//           backgroundColor={theme.palette.background.alt}
//           p="1rem"
//           borderRadius="0.55rem"
//         >
//           <Typography variant="h6" sx={{ color: theme.palette.secondary[100] }}>
//             Sales By Category
//           </Typography>
//           <BreakdownChart isDashboard={true} />
//           {/* <Typography
//             p="0 0.6rem"
//             fontSize="0.8rem"
//             sx={{ color: theme.palette.secondary[200] }}
//           >
//             Breakdown of real states and information via category for revenue
//             made for this year and total sales.
//           </Typography> */}
//         </Box>
//       </Box>
//     </Box>
//     </>
//   );
// };

// export default Dashboard;
