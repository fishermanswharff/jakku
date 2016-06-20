require 'spec_helper'
require_relative '../lib/foobar'

RSpec.describe Foobar do
  let(:foobar) { Foobar.new }

  describe '.first_hundred' do
    let(:first_hundred) { Foobar.first_hundred }

    it 'returns the results from 1 to 100' do
      expect(first_hundred).to include('3: foo', '6: foo', '9: foo', '12: foo', '99: foo')
      expect(first_hundred).to include('30: foobar', '45: foobar', '60: foobar', '75: foobar')
      expect(first_hundred).to include('5: bar', '10: bar', '20: bar', '25: bar')
    end

    it 'writes output' do
      expect { Foobar.first_hundred }.to output("\n3: foo, \n5: bar, \n6: foo, \n9: foo, \n10: bar, \n12: foo, \n15: foobar, \n18: foo, \n20: bar, \n21: foo, \n24: foo, \n25: bar, \n27: foo, \n30: foobar, \n33: foo, \n35: bar, \n36: foo, \n39: foo, \n40: bar, \n42: foo, \n45: foobar, \n48: foo, \n50: bar, \n51: foo, \n54: foo, \n55: bar, \n57: foo, \n60: foobar, \n63: foo, \n65: bar, \n66: foo, \n69: foo, \n70: bar, \n72: foo, \n75: foobar, \n78: foo, \n80: bar, \n81: foo, \n84: foo, \n85: bar, \n87: foo, \n90: foobar, \n93: foo, \n95: bar, \n96: foo, \n99: foo, \n100: bar \n").to_stdout
    end
  end

  describe '#parse' do
    let(:result) { foobar.parse(nums: [1,2,3,4,5,6,7,8,9,10,11,12]) }
    let(:string_test) { foobar.parse(nums: ['1','2','3','4','5','6','7','8','9','10','11','12']) }
    let(:bad_data) { foobar.parse(nums: ['somewhere','over','the','rainbow','way','up','high']) }
    let(:another_bad_data) { foobar.parse(nums: nil) }
    let(:as_array) { foobar.parse(nums: [1,2,3,4,5,6,7,8,9,10,11,12], as_array: true) }
    let(:range_input) { foobar.parse(nums: 1..100) }
    let(:range_input_include_all_nums) { foobar.parse(nums: 1..100, include_others: true) }

    it 'prints :foo after the number if divisible by 3' do
      expect(result).to include '3: foo'
      expect(result).to include '6: foo'
      expect(result).to include '9: foo'
      expect(result).to include '12: foo'
      expect(result).not_to include '4'
      expect(result).not_to include '8'
    end

    it 'prints :bar after the number if divisible by 5' do
      expect(result).to include '5: bar'
      expect(result).to include '10: bar'
      expect(range_input).to include '20: bar'
      expect(range_input).to include '25: bar'
      expect(range_input).to include '70: bar'
      expect(range_input).to include '80: bar'
    end

    it 'prints :foobar after the number if divisible by 3 && 5' do
      expect(range_input).to include '15: foobar'
      expect(range_input).to include '30: foobar'
      expect(range_input).to include '45: foobar'
      expect(range_input).to include '60: foobar'
    end

    it 'tries to convert stringified numbers to numbers if possible' do
      expect(string_test).to include '3: foo'
      expect(string_test).to include '6: foo'
      expect(string_test).to include '9: foo'
      expect(string_test).to include '12: foo'
      expect(string_test).not_to include '4'
      expect(string_test).not_to include '8'
    end

    it 'gracefully handles bad input' do
      expect(bad_data).to eq 'Please enter numbers or strings of numbers.'
      expect(another_bad_data).to eq 'No numbers were parsed.'
    end

    it 'returns the result as an array if as_array is true' do
      expect(as_array).to be_an Array
      expect(as_array.first).to eq '3: foo'
    end

    it 'works with a range passed in too' do
      expect(range_input).to include('3: foo', '6: foo', '9: foo', '12: foo', '99: foo')
      expect(range_input).to include('30: foobar', '45: foobar', '60: foobar', '75: foobar')
      expect(range_input).to include('5: bar', '10: bar', '20: bar', '25: bar')
    end

    it 'returns all the numbers if include_others is true' do
      expect(range_input_include_all_nums).to include('53', '56', '54: foo', '68', '74', '75: foobar', '40: bar', '100: bar')
    end

    it 'returns a notification if no numbers pass the conditions' do
      expect(foobar.parse(nums: '1')).to eq 'No numbers were parsed.'
      expect(foobar.parse(nums: %w(1 2 4 88))).to eq 'No numbers were parsed.'
    end

    it 'writes output' do
      expect { foobar.parse(nums: 1..100) }.to output("\n3: foo, \n5: bar, \n6: foo, \n9: foo, \n10: bar, \n12: foo, \n15: foobar, \n18: foo, \n20: bar, \n21: foo, \n24: foo, \n25: bar, \n27: foo, \n30: foobar, \n33: foo, \n35: bar, \n36: foo, \n39: foo, \n40: bar, \n42: foo, \n45: foobar, \n48: foo, \n50: bar, \n51: foo, \n54: foo, \n55: bar, \n57: foo, \n60: foobar, \n63: foo, \n65: bar, \n66: foo, \n69: foo, \n70: bar, \n72: foo, \n75: foobar, \n78: foo, \n80: bar, \n81: foo, \n84: foo, \n85: bar, \n87: foo, \n90: foobar, \n93: foo, \n95: bar, \n96: foo, \n99: foo, \n100: bar \n").to_stdout
    end
  end
end
