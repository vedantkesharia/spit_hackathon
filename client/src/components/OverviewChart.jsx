import React, { useMemo, useState } from "react";
import { ResponsiveLine } from "@nivo/line";
import { useTheme, MenuItem, Select } from "@mui/material";
import { data } from "./cmo_msp_mandi";

const OverviewChart = ({ data2 }) => {
  const theme = useTheme();
  const [selectedCommodity, setSelectedCommodity] = useState("SUGAR-CANE");

  const handleCommodityChange = (event) => {
    setSelectedCommodity(event.target.value);
  };

  const filteredData = useMemo(() => {
    if (!data) return [];

    // Filter data based on selected commodity
    console.log("Selected commodity:", selectedCommodity);
    return data.filter((item) => item.commodity === selectedCommodity);
  }, [data, selectedCommodity]);

  const chartData = useMemo(() => {
    if (!filteredData) return [];

    return filteredData.map((item) => ({
      x: item.year,
      y: item.msprice,
    }));
  }, [filteredData]);

  console.log("Filtered data:", filteredData);
  console.log("Chart data:", chartData);

  return (
    <>
      <Select
      sx={{
        padding: '0px',
        width: '20%',
        height: '15%',
        marginBottom: '20px',
      }}
        value={selectedCommodity}
        onChange={handleCommodityChange}
        displayEmpty
        inputProps={{ "aria-label": "Select Commodity" }}
      >
        <MenuItem value="" disabled>
          Select Commodity
        </MenuItem>
        {[
          "COTTON",
          "RICE(PADDY-HUS)",
          "Jowar_Hybrid",
          "SORGUM(JAWAR)",
          "BAJRI",
          "MAIZE",
          "Ragi_Maldandi",
          "SPLIT BLACK GRAM",
          "SUNFLOWER",
          "Soyabean_Black",
          "SESAMUM",
          "WHEAT(HUSKED)",
          "BARLI",
          "MUSTARD",
          "SAFFLOWER",
          "Toria_Yellow",
          "COCONUT",
        ].map((commodity) => (
          <MenuItem key={commodity} value={commodity}>
            {commodity}
          </MenuItem>
        ))}
      </Select>
      <ResponsiveLine
        data={[{ id: selectedCommodity, data: chartData }]}
        theme={{
          axis: {
            domain: {
              line: {
                stroke: theme.palette.secondary[200],
              },
            },
            legend: {
              text: {
                fill: theme.palette.secondary[200],
              },
            },
            ticks: {
              line: {
                stroke: theme.palette.secondary[200],
                strokeWidth: 1,
              },
              text: {
                fill: theme.palette.secondary[200],
              },
            },
          },
          legends: {
            text: {
              fill: theme.palette.secondary[200],
            },
          },
          tooltip: {
            container: {
              color: theme.palette.primary.main,
            },
          },
        }}
        margin={{ top: 10, right: 50, bottom: 100, left: 70 }}
        xScale={{ type: "linear", min: "auto", max: "auto" }}
        yScale={{ type: "linear", min: "auto", max: "auto", stacked: false, reverse: false }}
        curve="cardinal"
        axisBottom={{
          tickSize: 5,
          tickPadding: 5,
          tickRotation: 0,
          legend: "Year",
          legendPosition: "middle",
          legendOffset: 36,
        }}
        axisLeft={{
          tickValues: 5,
          tickSize: 5,
          tickPadding: 5,
          tickRotation: 0,
          legend: "MS Price",
          legendPosition: "middle",
          legendOffset: -60,
        }}
        enableGridX={false}
        enableGridY={false}
        colors={{ scheme: "nivo" }}
        lineWidth={2}
        pointSize={10}
        pointColor={{ theme: "background" }}
        pointBorderWidth={2}
        pointBorderColor={{ from: "serieColor" }}
        pointLabelYOffset={-12}
        useMesh={true}
      />
 </>
  );
};

export default OverviewChart;





// import React, { useMemo } from "react";
// import { ResponsiveLine } from "@nivo/line";
// import { useTheme } from "@mui/material";
// import { data } from "./cmo_msp_mandi";

// const OverviewChart = ({ data2 }) => {
//   const theme = useTheme();

//   const filteredData = useMemo(() => {
//     if (!data) return [];

//     // Filter data for commodity "SUGAR-CANE"
//     return data.filter((item) => item.commodity === "SUGAR-CANE");
//   }, [data]);

//   const chartData = useMemo(() => {
//     if (!filteredData) return [];

//     return filteredData.map((item) => ({
//       x: item.year,
//       y: item.msprice,
//     }));
//   }, [filteredData]);

//   return (
//     <ResponsiveLine
//       data={[{ id: "SUGAR-CANE", data: chartData }]}
//       theme={{
//         axis: {
//           domain: {
//             line: {
//               stroke: theme.palette.secondary[200],
//             },
//           },
//           legend: {
//             text: {
//               fill: theme.palette.secondary[200],
//             },
//           },
//           ticks: {
//             line: {
//               stroke: theme.palette.secondary[200],
//               strokeWidth: 1,
//             },
//             text: {
//               fill: theme.palette.secondary[200],
//             },
//           },
//         },
//         legends: {
//           text: {
//             fill: theme.palette.secondary[200],
//           },
//         },
//         tooltip: {
//           container: {
//             color: theme.palette.primary.main,
//           },
//         },
//       }}
//       margin={{ top: 20, right: 50, bottom: 50, left: 70 }}
//       xScale={{ type: "linear", min: "auto", max: "auto" }}
//       yScale={{ type: "linear", min: "auto", max: "auto", stacked: false, reverse: false }}
//       curve="cardinal"
//       axisBottom={{
//         tickSize: 5,
//         tickPadding: 5,
//         tickRotation: 0,
//         legend: "Year",
//         legendPosition: "middle",
//         legendOffset: 36,
//       }}
//       axisLeft={{
//         tickValues: 5,
//         tickSize: 5,
//         tickPadding: 5,
//         tickRotation: 0,
//         legend: "MS Price",
//         legendPosition: "middle",
//         legendOffset: -60,
//       }}
//       enableGridX={false}
//       enableGridY={false}
//       colors={{ scheme: "nivo" }}
//       lineWidth={2}
//       pointSize={10}
//       pointColor={{ theme: "background" }}
//       pointBorderWidth={2}
//       pointBorderColor={{ from: "serieColor" }}
//       pointLabelYOffset={-12}
//       useMesh={true}
//     />
//   );
// };

// export default OverviewChart;