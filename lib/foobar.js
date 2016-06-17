'use strict';

export function map(array,func){
  if(typeof func !== 'function'){
    return 'given argument is not a function';
  }

  let arr = [];
  let valid = true;

  array.forEach((value, index, array) => {
    if(isNaN(value)) {
      valid = false;
    } else {
      arr.push(func.call(array, value));
    }
  });

  if(!valid) {
    return 'array should contain only numbers';
  } else {
    return arr;
  }
};

