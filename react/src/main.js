import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  ReactDOM.render(
    <p>Boo yaa</p>,
    document.getElementById('react')
  );
});
