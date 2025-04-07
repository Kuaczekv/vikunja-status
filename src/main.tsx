import React from 'react';
import ReactDOM from 'react-dom/client';
import './style.css';

const App = () => (
  <div>
    <h1>Witaj w systemie monitorowania statusu sprzętu</h1>
  </div>
);

ReactDOM.createRoot(document.getElementById('root')!).render(<App />);
