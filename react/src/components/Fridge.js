import React from 'react';
import FridgeCategory from './FridgeCategory';

const Fridge = props => {
  let fridgeCategories = props.groceries.map(fridgeCategory => {
    return (
      <FridgeCategory
        key={id}
        name={name}
      />
    );
  });

  return (
    <ul>
      <li>{fridgeCategories}</li>
    </ul>
  );
};

export default FridgeCategory;
