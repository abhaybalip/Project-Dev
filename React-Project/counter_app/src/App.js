
import React, { useState } from 'react';

import './Asset/style.css'
import { Counter } from './Asset/Counter';

function App() {
    return (
        <div className="App" style={{
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-evenly',
            alignItems: 'center'
        }}>
            <h1>Counter App</h1>
            <Counter />
        </div>
    );
}

export default App;
