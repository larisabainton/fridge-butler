// App.js
import React, { Component } from 'react';
import Fridge from './Fridge';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: []
    };

    this.getCategories = this.getCategories.bind(this);
  }

  getCategories() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/fridgecategories.json',
      contentType: 'application/json'
    }) .done(data => {
      app.setState({ categories: data })
    })
  }

  render() {
    let categories = this.state.categories;
    categories.getCategories();

    return(
      <Fridge
        fridgeCategories = {categories}
      />
    )
  }
}

export default App;
