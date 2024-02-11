import React, { useState } from 'react';
import axios from 'axios';
import './form.css'
const { GoogleGenerativeAI } = require("@google/generative-ai");

const Form = () => {
    const [formData, setFormData] = useState({
        name: '',
        age: '',
        location: '',
        landOwnership: '',
        incomeSources: '',
        savings: ''
    });
    
    const [analysisResult, setAnalysisResult] = useState(null);
    const prompt = "Give a rough estimate of cibil score using the following details of a farmer, its okay if estimate is very rough, just give the number as the output.";
   
    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const API_KEY = "AIzaSyCwHHCLAEInXJrGE1ZS1XsWhLz4L4yUMkw"; // Replace with your Google Generative AI API key
    const genAI = new GoogleGenerativeAI(API_KEY);

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        const model = genAI.getGenerativeModel({ model: "gemini-pro" });
        const result = await model.generateContent(prompt);
        const text = result.response.text();
        setAnalysisResult(text);
    };

    return (
        <div className='formDiv'>
            <form onSubmit={handleSubmit} className='formContainer'>
                <label>
                    Name:
                    <input
                        type="text"
                        name="name"
                        value={formData.name}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Age:
                    <input
                        type="number"
                        name="age"
                        value={formData.age}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Location:
                    <input
                        type="text"
                        name="location"
                        value={formData.location}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Land Ownership:
                    <input
                        type="text"
                        name="landOwnership"
                        value={formData.landOwnership}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Income Sources:
                    <input
                        type="text"
                        name="incomeSources"
                        value={formData.incomeSources}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Savings:
                    <input
                        type="number"
                        name="savings"
                        value={formData.savings}
                        onChange={handleChange}
                    />
                </label>
                <div className="submitBtn">
                <button type="submit">Submit</button>
                </div>
            </form>

            {analysisResult && (
                <div>
                    <h2>Analysis Result:</h2>
                    <p>{analysisResult}</p>
                </div>
            )}
        </div>
    );
};

export default Form;