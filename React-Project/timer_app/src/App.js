import React, { useState, useEffect } from "react";
import './App.css';

export default function App() {
  const [timer, setTimer] = useState({
    hour: 0,
    min: 0,
    sec: 0,
  });
  const [isRunning, setIsRunning] = useState(false);

  const startTimer = () => {
    setIsRunning(true);
  };

  const stopTimer = () => {
    setIsRunning(false);
  };

  const resetTimer = () => {
    setTimer({ hour: 0, min: 0, sec: 0 });
  };


  useEffect(() => {
    let intervalId;

    if (isRunning) {
      intervalId = setInterval(() => {
        const newTimer = { ...timer }; // Create a copy to avoid mutation
        newTimer.sec++;

        if (newTimer.sec === 60) {
          newTimer.sec = 0;
          newTimer.min++;
        }

        if (newTimer.min === 60) {
          newTimer.min = 0;
          newTimer.hour++;
        }

        setTimer(newTimer);
      }, 1000);
    }

    return () => clearInterval(intervalId)
  }, [isRunning, timer])

  return (
    <>
      <div id="main" style={{ userSelect: 'none', display: "flex", flexDirection: "column", justifyContent: 'center', alignItems: 'center' }}>
        <h2>Timer App</h2>
        <div id="display" style={{ fontSize: 'larger' }}>
          {timer.hour.toString().padStart(2, '0')} : {timer.min.toString().padStart(2, '0')} : {timer.sec.toString().padStart(2, '0')}
        </div>
        <div id="button" style={{ display: "flex", flexDirection: 'row' }}>
          <div className="button" onClick={startTimer} disabled={isRunning}>Start</div>
          <div className="button" onClick={stopTimer} disabled={!isRunning}>Stop</div>
          <div className="button" onClick={resetTimer}>Reset</div>
        </div>
      </div>
    </>
  );
}
