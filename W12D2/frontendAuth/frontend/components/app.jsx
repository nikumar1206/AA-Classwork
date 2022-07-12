import React from "react";
import WelcomeBar from "./nav_bar/welcome_bar_container";
import NavBarContainer from "./nav_bar/nav_bar_container";
import ChirpIndexContainer from "./chirps/chirp_index_container";
import SignUpContainer from "./session/signup_container";
import Home from "./home/home";
import { Route, Routes } from "react-router-dom";

export default () => (
  <div>
    <Routes>
      <Route path="/" element={<NavBarContainer />} />
      <Route exact path="/" element={<Home />} />
      <Route path="/chirps" element={<ChirpIndexContainer />} />
      <Route path="/signup" element={<SignUpContainer />} />
    </Routes>
  </div>
);
