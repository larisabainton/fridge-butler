import React from 'react';
import FridgeCategory from './FridgeCategory';

const Fridge = props => {
  let fridgeCategories = props.groceries.map(fridgeCategory => {
    const { id, name } = fridgeCategory;
    let onButtonClick = () => props.handleButtonClick(id);

    return (
      <FridgeCategory
        key={id}
        name={name}
        handleButtonClick={onButtonClick}
      />
    );
  });

  return (
    <div className="row grocery-list">
      <div className="small-11 small-centered columns">
        <ul>
          {fridgeCategories}
        </ul>
      </div>
    </div>
  );
};

export default FridgeCategory;
