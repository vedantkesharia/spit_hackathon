import React, { useState, useEffect } from "react";
import "./styles.css"; // Import your stylesheet

import { useSignup } from "../../hooks/useSignup";
import { useLogin } from "../../hooks/useLogin";

const AuthForm = () => {
  const [isSignIn, setIsSignIn] = useState(true);

  const [usernameSignUp, setUsernameSignUp] = useState();
  const [emailSignUp, setEmailSignUp] = useState();
  const [passwordSignUp, setPasswordSignUp] = useState();
  const [role, setRole] = useState();

  const { signup, error, isLoading } = useSignup();

  const [emailSignIn, setEmailSignIn] = useState();
  const [passwordSignIn, setPasswordSignIn] = useState();

  const { login, errorLogin, isLoadingLogin } = useLogin();

  useEffect(() => {
    // Set initial class after a delay
    const timer = setTimeout(() => {
      setIsSignIn(true);
    }, 200);

    return () => clearTimeout(timer);
  }, []);

  const toggle = () => {
    setIsSignIn((prev) => !prev);
  };

  const handleSignup = async (e) => {
    await signup(emailSignUp, passwordSignUp, usernameSignUp,role);
  };

  const handleSignin = async (e) => {
    await login(emailSignIn, passwordSignIn);
  };

  return (
    <div
      id="container"
      className={`container ${isSignIn ? "sign-in" : "sign-up"}`}
    >
      {/* FORM SECTION */}
      <div className="row">
        {/* SIGN UP */}
        <div className="col align-items-center flex-col sign-up">
          <div className="form-wrapper align-items-center">
            <div className="form sign-up">
              <div className="input-group">
                <i className="bx bxs-user"></i>
                <input
                  type="text"
                  placeholder="Username"
                  value={usernameSignUp}
                  onChange={(e) => setUsernameSignUp(e.target.value)}
                  style={{color:'black'}}
                />
              </div>
              <div className="input-group">
                <i className="bx bx-mail-send"></i>
                <input
                  type="email"
                  placeholder="Email"
                  value={emailSignUp}
                  onChange={(e) => setEmailSignUp(e.target.value)}
                  style={{color:'black'}}
                />
              </div>
              <div className="input-group">
                <i className="bx bxs-lock-alt"></i>
                <input
                  type="password"
                  placeholder="Password"
                  value={passwordSignUp}
                  onChange={(e) => setPasswordSignUp(e.target.value)}
                  style={{color:'black'}}
                />
              </div>
              <div className="input-group">
                <i className="bx bxs-lock-alt"></i>
                {/* <input type="password" placeholder="Confirm password" /> */}
                <select
                  name="role"
                  className="black"
                  id="role"
                  value={role} // bind the value of the select element to the state variable
                  onChange={(e) => setRole(e.target.value)} // update the role state when the select value changes
                >
                  <option value="user">User</option>
                  <option value="admin">Lender</option>
                </select>
              </div>
              <button onClick={handleSignup}>Sign up</button>

              <p className="black">
                <span>Already have an account?</span>
                <b onClick={toggle} className="pointer" disabled={isLoading}>
                  Sign in here
                </b>
              </p>
              {error && <div className="border border-1 text-sm ">{error}</div>}
            </div>
          </div>
        </div>
        {/* END SIGN UP */}
        {/* SIGN IN */}
        <div className="col align-items-center flex-col sign-in">
          <div className="form-wrapper align-items-center">
            <div className="form sign-in">
              <div className="input-group">
                <i className="bx bxs-user"></i>
                <input
                  type="email"
                  placeholder="Email"
                  value={emailSignIn}
                  onChange={(e) => setEmailSignIn(e.target.value)}
                  style={{color:'black'}}
                />
              </div>
              <div className="input-group">
                <i className="bx bxs-lock-alt"></i>
                <input
                  type="password"
                  placeholder="Password"
                  value={passwordSignIn}
                  onChange={(e) => setPasswordSignIn(e.target.value)}
                  style={{color:'black'}}
                />
              </div>
              <button onClick={handleSignin}>Sign in</button>
              <p className="black">
                <b>Forgot password?</b>
              </p>
              <p className="black">
                <span>Don't have an account?</span>
                <b onClick={toggle} className="pointer">
                  Sign up here
                </b>
              </p>
            </div>
          </div>
          <div className="form-wrapper">
            {/* ... Your additional content ... */}
          </div>
        </div>
        {/* END SIGN IN */}
      </div>
      {/* END FORM SECTION */}
      {/* CONTENT SECTION */}
      <div className="row content-row">
        {/* SIGN IN CONTENT */}
        <div className="col align-items-center flex-col">
          <div className="text sign-in">
            <h2>Welcome</h2>
          </div>
          <div className="img sign-in">
            {/* ... Your sign-in content ... */}
          </div>
        </div>
        {/* END SIGN IN CONTENT */}
        {/* SIGN UP CONTENT */}
        <div className="col align-items-center flex-col">
          <div className="img sign-up">
            {/* ... Your sign-up content ... */}
          </div>
          <div className="text sign-up">
            <h2>Join with us</h2>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AuthForm;
