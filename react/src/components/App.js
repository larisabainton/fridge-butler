import React, { Component } from 'react';
import GroceryForm from './GroceryForm';
import GroceryList from './GroceryList';
import Fridgecategory from './Fridgecategories';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      groceries: [],
      name: ''
    };

    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  getGroceries {
    $.ajax({
      type: 'GET'
      url: '/groceries/index'
    })
  }

  // handleFormSubmit(event) {
  //   event.preventDefault();
  //   let newGrocery = {
  //     name: this.state.name
  //   };
  //   let newGroceries = [...this.state.groceries, newGrocery];
  //   this.setState({
  //     groceries: newGroceries,
  //     name: ''
  //   });
  //   $.ajax({
  //     type: 'POST',
  //     url: '/api/groceries',
  //     data: JSON.stringify({name: this.state.name}),
  //     contentType: 'application/json'
  //   })
  // }
  //
  // handleButtonClick(id) {
  //   let newGroceries = this.state.groceries.filter(grocery => {
  //     $.ajax({
  //       type: 'DELETE',
  //       url: `api/groceries/${id}`,
  //     });
  //     return grocery.id !== id;
  //   });
  //   this.setState({ groceries: newGroceries });
  // }
  //
  // handleChange(event) {
  //   let newName = event.target.value;
  //   this.setState({ name: newName });
  // }
  //
  // componentDidMount() {
  //   $.ajax({
  //     url: '/api/groceries',
  //     contentType: 'application/json'
  //   })
  //   .done(data => {
  //     this.setState({ groceries: data.groceries })
  //   })
  // }

  render() {
    return(
      <div>
        <Fridgecategory />
        <GroceryForm />
      </div>
      // <% @fridgecategories.each do |fc| %>
      // <tr>
      //   <th>
      //     <h3 class = "delete-fc"><%= link_to fc.name, edit_fridgecategory_path(fc) %></h3>
      //   </th>
      //   <td class = "delete-category">
      //     <%= link_to '', fc, method: :delete, data: { confirm: 'You sure?' }, class: 'fa fa-times' %>
      //   </td>
      // </tr>
      // <tr>
      //   <% @groceries = fc.groceries.order(name: :asc) %>
      //   <% @groceries.each do |grocery| %>
      //     <% if grocery.grocerylist_id == nil %>
      //       <% if !grocery.exp_date.nil? && grocery.exp_date <= 2.day.from_now && grocery.exp_date > 0.day.from_now %>
      //       <td id = "almost-expired">
      //         <%= link_to grocery.name, edit_grocery_path(grocery) %> - Almost Expired
      //       </td>
      //       <td class = "delete-grocery">
      //         <%= link_to '', grocery, method: :delete, data: { confirm: 'You sure?' }, class: 'fa fa-times' %>
      //       </td>
      //         <% elsif !grocery.exp_date.nil? && grocery.exp_date <= Date.current %>
      //         <td id = "expired">
      //           <%= link_to grocery.name, edit_grocery_path(grocery) %> - Expired
      //         </td>
      //         <td class = "delete-grocery">
      //           <%= link_to '', grocery, method: :delete, data: { confirm: 'You sure?' }, class: 'fa fa-times' %>
      //         </td>
      //         <% else %>
      //         <td id = "not-expired">
      //           <%= link_to grocery.name, edit_grocery_path(grocery) %>
      //         </td>
      //         <td class = "delete-grocery">
      //           <%= link_to '', grocery, method: :delete, data: { confirm: 'You sure?' }, class: 'fa fa-times' %>
      //         </td>
      //         <% end %>
      //      <% end %>
      //   </tr>
      //   <% end %>
      // <% end %>


      <div>
        <GroceryForm
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
        />
        <GroceryList
          groceries={this.state.groceries}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    );
  }
}

export default App;
