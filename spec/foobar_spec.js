// run with `npm test`
'use strict';
import {map} from '../lib/foobar.js';

describe('Map Function Issue', () => {
  // setup
  let func = function(item){
    return item % 2 == 0
  };
  let array1 = [1,2,3,'8'];
  let array2 = [77,84,18,43,16,70,53];
  let array3 = [10,10,5,-2];
  let array4 = [1,96,37,60,7];

  // assert
  it('returns an array of booleans if the numbers are even or odd', () => {
    // expect
    expect(map(array1,func)).toEqual([false,true,false,true]);
    expect(map(array2,func)).toEqual([false,true,true,false,true,true,false]);
  });

  it('should work for random inputs too', () => {
    expect(map(array3,func)).toEqual([true,true,false,true]);
  });

  it('returns "given argument is not a function" if not passed a function', () => {
    expect(map(array4,'test')).toEqual('given argument is not a function');
  });

  it('returns "array should contain only numbers" if an array does not contain a number', () => {
    expect(map([72,12,30,'q'],func)).toEqual('array should contain only numbers');
  });

  // teardown
  afterEach(() => {});
});
