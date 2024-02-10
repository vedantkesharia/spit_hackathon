import React, { Component } from "react";
import { Crisp } from "crisp-sdk-web";

class Crispjs extends Component {
  componentDidMount() {
    const websiteId = process.env.REACT_APP_CRISP_SECRET_KEY;

    if (!websiteId) {
      console.error("Crisp websiteId not defined in .env");
      return;
    }

    Crisp.configure( websiteId );
  }



  render() {
    return (
     <div>

     </div>
    );
  }
}

export default Crispjs;