import { CssBaseline, ThemeProvider } from "@mui/material";
import { createTheme } from "@mui/material/styles";
import { useMemo } from "react";
import { useSelector } from "react-redux";
import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import { themeSettings } from "theme";
import Layout from "scenes/layout";
import Dashboard_admin from "./scenes/dashboard/dashboard_admin";
import Dashboard_user from "./scenes/dashboard/dashboard_farmer";
import Products from "scenes/products";
import Customers from "scenes/customers";
import Transactions from "scenes/transactions";
import Geography from "scenes/geography";
import Overview from "scenes/overview";
import Daily from "scenes/daily";
import Monthly from "scenes/monthly";
import Breakdown from "scenes/breakdown";
import Admin from "scenes/admin";
import Performance from "scenes/performance";
import Form from "components/Form";

import AuthForm from "./pages/Auth/AuthForm";

import { useAuthContext } from "./hooks/useAuthContext";
import Payment from "components/Payment";
import Crispjs from "components/Crisp";
import FarmerForm from "components/FarmerForm";
import Dashboard from "scenes/dashboard";
import News from "components/News";
function App() {
  const { user } = useAuthContext();
  const mode = useSelector((state) => state.global.mode);
  const theme = useMemo(() => createTheme(themeSettings(mode)), [mode]);
  return (
    // <div className="app">
    <>
      <BrowserRouter>
        <ThemeProvider theme={theme}>
          <CssBaseline />
          <Routes>
            {/* <Route element={<Layout />}> */}
            {/* <Route
              path="/"
              element={
                (user.role=="user") ? (
                  <Navigate to="/dashboard" replace />
                ) : (
                  <Navigate to="/auth" />
                )
              }
            />  */}
            <Route path="/" element={<Navigate to="/auth" />} />
            <Route
              path="/auth"
              element={!user ? <AuthForm /> : <Navigate to="/dashboard" />}
            />
            <Route element={<Layout />}>
              {/* <Route path="/" element={<Navigate to="/dashboard" replace />} />  */}
              <Route path="/dashboard" element={<Dashboard />} />
              <Route path="/dashboard_admin" element={<Dashboard_admin />} />
              <Route path="/dashboard_user" element={<Dashboard_user />} />
              <Route path="/payment" element={<Payment />} />
              <Route path="/farmerform" element={<FarmerForm />} />
              <Route path="/products" element={<Products />} />
              <Route path="/customers" element={<Customers />} />
              <Route path="/transactions" element={<Transactions />} />
              <Route path="/geography" element={<Geography />} />
              <Route path="/overview" element={<Overview />} />
              <Route path="/daily" element={<Daily />} />
              <Route path="/monthly" element={<Monthly />} />
              <Route path="/breakdown" element={<Breakdown />} />
              <Route path="/admin" element={<Admin />} />
              <Route path="/performance" element={<Performance />} />
              <Route path="/form" element={<Form />} />
              <Route path="/news" element={<News />} />
            </Route>
          </Routes>
        </ThemeProvider>
      </BrowserRouter>
      <Crispjs />
      {/* </div> */}
    </>
  );
}

export default App;








// import { CssBaseline, ThemeProvider } from "@mui/material";
// import { createTheme } from "@mui/material/styles";
// import { useMemo } from "react";
// import { useSelector } from "react-redux";
// import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
// import { themeSettings } from "theme";
// import Layout from "scenes/layout";
// import Dashboard_admin from "./scenes/dashboard/dashboard_admin"
// import Dashboard_user from "./scenes/dashboard/dashboard_farmer"
// import Products from "scenes/products";
// import Customers from "scenes/customers";
// import Transactions from "scenes/transactions";
// import Geography from "scenes/geography";
// import Overview from "scenes/overview";
// import Daily from "scenes/daily";
// import Monthly from "scenes/monthly";
// import Breakdown from "scenes/breakdown";
// import Admin from "scenes/admin";
// import Performance from "scenes/performance";
// import Form from "components/Form";

// import AuthForm from "./pages/Auth/AuthForm";

// import { useAuthContext } from "./hooks/useAuthContext";
// import Payment from "components/Payment";
// import Crispjs from "components/Crisp";
// import FarmerForm from "components/FarmerForm";
// import Dashboard from "scenes/dashboard";


// function App() {
//     const { user } = useAuthContext();
//   const mode = useSelector((state) => state.global.mode);
//   const theme = useMemo(() => createTheme(themeSettings(mode)), [mode]);
//   return (
//     // <div className="app">
//     <>
      
//       <BrowserRouter>
//         <ThemeProvider theme={theme}>
//           <CssBaseline />
//           <Routes>
//           {/* <Route element={<Layout />}> */}
//             {/* <Route
//               path="/"
//               element={
//                 (user.role=="user") ? (
//                   <Navigate to="/dashboard" replace />
//                 ) : (
//                   <Navigate to="/auth" />
//                 )
//               }
//             />  */}
//              <Route
//               path="/"
//               element={
//                   <Navigate to="/auth" />
//               }
//             /> 
//             <Route
//               path="/auth"
//               element={!user ? <AuthForm /> : <Navigate to="/dashboard" />}
//             />
//                <Route element={<Layout />}>
//                {/* <Route path="/" element={<Navigate to="/dashboard" replace />} />  */}
//                <Route path="/dashboard" element={<Dashboard/>} />
//               <Route path="/dashboard_admin" element={<Dashboard_admin />} />
//               <Route path="/dashboard_user" element={<Dashboard_user />} />
//               <Route path="/payment" element={<Payment/>}/>
//               <Route path="/farmerform" element={<FarmerForm/>}/>
//               <Route path="/products" element={<Products />} />
//               <Route path="/customers" element={<Customers />} />
//               <Route path="/transactions" element={<Transactions />} />
//               <Route path="/geography" element={<Geography />} />
//               <Route path="/overview" element={<Overview />} />
//               <Route path="/daily" element={<Daily />} />
//               <Route path="/monthly" element={<Monthly />} />
//               <Route path="/breakdown" element={<Breakdown />} />
//               <Route path="/admin" element={<Admin />} />
//               <Route path="/performance" element={<Performance />} />
//               <Route path="/form" element={<Form />} />

//             </Route>
//           </Routes>
//         </ThemeProvider>
//       </BrowserRouter>
//       <Crispjs/>
//     {/* </div> */}
//     </>
//   );
// }

// export default App;
