import 'babel-polyfill';
import React from 'react';
import ReactDom from 'react-dom';
import App from './components/App'

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});
