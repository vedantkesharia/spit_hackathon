import React, { useState, useEffect } from "react";
import { GoogleGenerativeAI } from "@google/generative-ai";
import "./form.css";

const News = () => {
  const [analysisResult, setAnalysisResult] = useState(null);
  const prompt =
    "Give some best farming techniques for farmers so that they get a better yield, just give techniques with one para on each technique dont give any other content ";

  useEffect(() => {
    const fetchData = async () => {
      const API_KEY = "AIzaSyCwHHCLAEInXJrGE1ZS1XsWhLz4L4yUMkw"; // Replace with your Google Generative AI API key
      const genAI = new GoogleGenerativeAI(API_KEY);
      const model = genAI.getGenerativeModel({ model: "gemini-pro" });
      const result = await model.generateContent(prompt);
      setAnalysisResult(result.response.text());
    };

    fetchData();
  }, [prompt]);

  // Function to remove bold formatting from text
  const removeBoldFormatting = (text) => {
    return text.replace(/\\(.?)\\*/g, "$1");
  };

  // Function to split text into paragraphs
  const renderParagraphs = (text) => {
    return removeBoldFormatting(text)
      .split("\n")
      .map((paragraph, index) => <p key={index}>{paragraph}</p>);
  };

  return (
    <div className="formDiv">
      <iframe
        width="560"
        height="315"
        src="https://www.youtube.com/embed/XSWhoA4_JvE?si=OKK9I4Fo_SiLwTnX"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        allowfullscreen
      ></iframe>
      {analysisResult && (
        <div className="margin:'20px'">
          <h2>Analysis Result:</h2>
          {renderParagraphs(analysisResult)}
        </div>
      )}
    </div>
  );
};

export default News;