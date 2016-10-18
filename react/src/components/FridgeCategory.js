import React from 'react';

const FridgeCategory = props => {
  return (
    <li className="fridgeCategory">
      <div>
        <span>{props.name}</span>
      </div>
    </li>
  );
};

export default FridgeCategory;
