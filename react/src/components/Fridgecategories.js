import React, { Component } from 'react';

class Fridgecategory extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: ''
    }
  };

  let groceries = props.groceries.map(grocery => {
    const { id, name } = grocery;
    let onButtonClick = () => props.handleButtonClick(id);

    return (
      <Grocery
        key={id}
        name={name}
        handleButtonClick={onButtonClick}
      />
    );
  }

  render() {
    return(
      <div>
        name = {this.state.name}
        {groceries}
      </div>

    )
  }
}

export default Fridgecategory;
