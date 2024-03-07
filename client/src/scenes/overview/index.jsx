import React, { useState } from "react";
import { FormControl, MenuItem, InputLabel, Box, Select } from "@mui/material";
import Header from "components/Header";
import OverviewChart from "components/OverviewChart";

const Overview = () => {
  const [view, setView] = useState("units");

  return (
    <Box m="1.5rem 2.5rem">
      <Header
        title="PRICE FLUCTUATION OF CROPS OVER THE YEARS "
        subtitle="Overview of general revenue and profit"
      />
      <Box height="75vh">
        <OverviewChart view={view} />
      </Box>
    </Box>
  );
};

export default Overview;
