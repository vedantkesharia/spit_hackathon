import React, { useState, useEffect } from "react";
import FlexBetween from "components/FlexBetween";
import Header from "components/Header";
import {
  DownloadOutlined,
  Email,
  PointOfSale,
  PersonAdd,
  Traffic,
} from "@mui/icons-material";
import {
  Box,
  Button,
  Typography,
  useTheme,
  useMediaQuery,
} from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import BreakdownChart from "components/BreakdownChart";
import OverviewChart from "components/OverviewChart";
import { useGetDashboardQuery } from "state/api";
import StatBox from "components/StatBox";
import Crispjs from "components/Crisp";
import { useNavigate } from "react-router-dom";
// Import Gemini and data
import { GoogleGenerativeAI } from "@google/generative-ai";


const Dashboard = () => {
  const theme = useTheme();
  const isNonMediumScreens = useMediaQuery("(min-width: 1200px)");
  const { data, isLoading } = useGetDashboardQuery();
  const navigate = useNavigate();
  const [cropPrediction, setCropPrediction] = useState("");
  // const user = localStorage.getItem("user");
  // console.log(user);
 



  const API_KEY = "AIzaSyCwHHCLAEInXJrGE1ZS1XsWhLz4L4yUMkw"
  useEffect(() => {
    // Initialize Gemini and make prediction
    const runGemini = async () => {
      const genAI = new GoogleGenerativeAI(API_KEY);
      const model = genAI.getGenerativeModel({ model: "gemini-pro" });
      const prompt = "Predict the most profitable commodity to grow based on the given data, just give output as crop name, its okk if you give a rough answer, you can calculate which commodity had the most max_price and display that"
      const data = [ {
        "APMC": "Ahmednagar",
        "Commodity": "Bajri",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 79,
        "min_price": 1406,
        "max_price": 1538,
        "modal_price": 1463,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Bajri",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 106,
        "min_price": 1788,
        "max_price": 1925,
        "modal_price": 1875,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Wheat(Husked)",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 1253,
        "min_price": 1572,
        "max_price": 1890,
        "modal_price": 1731,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Wheat(Husked)",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 387,
        "min_price": 1750,
        "max_price": 2220,
        "modal_price": 1999,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Sorgum(Jawar)",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 3825,
        "min_price": 1600,
        "max_price": 2200,
        "modal_price": 1900,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Sorgum(Jawar)",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 2093,
        "min_price": 1695,
        "max_price": 2454,
        "modal_price": 2119,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Maize",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 75,
        "min_price": 1345,
        "max_price": 1401,
        "modal_price": 1373,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Maize",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 155,
        "min_price": 1367,
        "max_price": 1392,
        "modal_price": 1375,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Gram",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 1794,
        "min_price": 3533,
        "max_price": 3762,
        "modal_price": 3647,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Gram",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 630,
        "min_price": 4790,
        "max_price": 5553,
        "modal_price": 5216,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Horse Gram",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 3,
        "min_price": 7150,
        "max_price": 7150,
        "modal_price": 7150,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Matki",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 1,
        "min_price": 7500,
        "max_price": 7500,
        "modal_price": 7500,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Pigeon Pea (Tur)",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 144,
        "min_price": 4993,
        "max_price": 5373,
        "modal_price": 5233,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Pigeon Pea (Tur)",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 33,
        "min_price": 6900,
        "max_price": 7700,
        "modal_price": 7329,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Black Gram",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 7,
        "min_price": 5700,
        "max_price": 5700,
        "modal_price": 5700,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Black Gram",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 2,
        "min_price": 7500,
        "max_price": 7500,
        "modal_price": 7500,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Castor Seed",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 3,
        "min_price": 3313,
        "max_price": 3313,
        "modal_price": 3313,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Soybean",
        "Year": 2015,
        "Month": "April",
        "arrivals_in_qtl": 12,
        "min_price": 2900,
        "max_price": 3400,
        "modal_price": 3150,
        "date": "2015-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },
      {
        "APMC": "Ahmednagar",
        "Commodity": "Soybean",
        "Year": 2016,
        "Month": "April",
        "arrivals_in_qtl": 20,
        "min_price": 2200,
        "max_price": 3900,
        "modal_price": 3603,
        "date": "2016-04",
        "district_name": "Ahmadnagar",
        "state_name": "Maharashtra"
      },];

       // Prompt for Gemini
      const result = await model.generateContent(prompt);
      const response = await result.response;
      const text = await response.text();
      setCropPrediction(text);
    };

    runGemini();
  }, []);

  const columns = [
    {
      field: "_id",
      headerName: "ID",
      flex: 1,
    },
    {
      field: "userId",
      headerName: "User ID",
      flex: 1,
    },
    {
      field: "createdAt",
      headerName: "CreatedAt",
      flex: 1,
    },
    {
      field: "products",
      headerName: "# of Products",
      flex: 0.5,
      sortable: false,
      renderCell: (params) => params.value.length,
    },
    {
      field: "cost",
      headerName: "Cost",
      flex: 1,
      renderCell: (params) => `$${Number(params.value).toFixed(2)}`,
    },
  ];

  return (
    <>
      <Crispjs />
      <Box m="1.5rem 2.5rem">
        <FlexBetween>
          <Header title="Lender Dashboard" subtitle="Welcome to your dashboard" />
         
          <Box>
            <Button
              sx={{
                backgroundColor: theme.palette.secondary.light,
                color: theme.palette.background.alt,
                fontSize: "14px",
                fontWeight: "bold",
                padding: "10px 20px",
              }}
              onClick={() => {
                navigate("/form");
              }}
            >
              Check CIBIL Score
            </Button>
          </Box>
        </FlexBetween>

        <Box
          mt="20px"
          display="grid"
          gridTemplateColumns="repeat(12, 1fr)"
          gridAutoRows="160px"
          gap="20px"
          sx={{
            "& > div": { gridColumn: isNonMediumScreens ? undefined : "span 12" },
          }}
        >
          {/* ROW 1 */}
          {/* <StatBox
            title="Total Customers"
            value={data && data.totalCustomers}
            increase="+14%"
            description="Since last month"
            icon={
              <Email
                sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
              />
            }
          /> */}
          <StatBox
            title="Crop Prediction"
            value={cropPrediction}
            increase="" // If applicable
            description="Most profitable crop to grow"
            icon={<Traffic sx={{ color: theme.palette.secondary[300], fontSize: "26px" }} />}
          />
          <StatBox
            title="Sales Today"
            value={data && data.todayStats.totalSales}
            increase="+21%"
            description="Since last month"
            icon={
              <PointOfSale
                sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
              />
            }
          />
          <Box
            gridColumn="span 8"
            gridRow="span 2"
            backgroundColor={theme.palette.background.alt}
            p="1rem"
            borderRadius="0.55rem"
          >
            <OverviewChart view="sales" isDashboard={true} />
          </Box>
          <StatBox
            title="Monthly Sales"
            value={data && data.thisMonthStats.totalSales}
            increase="+5%"
            description="Since last month"
            icon={
              <PersonAdd
                sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
              />
            }
          />
          <StatBox
            title="Yearly Sales"
            value={data && data.yearlySalesTotal}
            increase="+43%"
            description="Since last month"
            icon={
              <Traffic
                sx={{ color: theme.palette.secondary[300], fontSize: "26px" }}
              />
            }
          />

          {/* ROW 2 */}
          <Box
            gridColumn="span 7"
            gridRow="span 3"
            sx={{
              "& .MuiDataGrid-root": {
                border: "none",
                borderRadius: "5rem",
              },
              "& .MuiDataGrid-cell": {
                borderBottom: "none",
              },
              "& .MuiDataGrid-columnHeaders": {
                backgroundColor: theme.palette.background.alt,
                color: theme.palette.secondary[100],
                borderBottom: "none",
              },
              "& .MuiDataGrid-virtualScroller": {
                backgroundColor: theme.palette.background.alt,
              },
              "& .MuiDataGrid-footerContainer": {
                backgroundColor: theme.palette.background.alt,
                color: theme.palette.secondary[100],
                borderTop: "none",
              },
              "& .MuiDataGrid-toolbarContainer .MuiButton-text": {
                color: `${theme.palette.secondary[200]} !important`,
              },
            }}
          >
            <DataGrid
              loading={isLoading || !data}
              getRowId={(row) => row._id}
              rows={(data && data.transactions) || []}
              columns={columns}
            />
          </Box>
          <Box
            gridColumn="span 5"
            gridRow="span 3"
            backgroundColor={theme.palette.background.alt}
            p="1rem"
            borderRadius="0.55rem"
          >
            <Typography variant="h6" sx={{ color: theme.palette.secondary[100] }}>
              Sales By Category
            </Typography>
            <BreakdownChart isDashboard={true} />
          </Box>
        </Box>
      </Box>
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
