import React from "react";
import './App.css'
import ClassCounter from "./componets/classCounter";
import HookCounter from "./componets/hookCounter";
function App() {
  return (
    <div className="container">
      useState Hook
      <ClassCounter/>
      <HookCounter/>
    </div>
  );
}

export default App;
