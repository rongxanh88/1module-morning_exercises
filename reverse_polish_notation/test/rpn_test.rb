require 'minitest'
require 'minitest/autorun'
require './lib/rpn'

class ReversePolishNotationTest < Minitest::Test

  def test_it_exists
    calculator = ReversePolishNotation.new
    assert_instance_of ReversePolishNotation, calculator
  end

  def test_calculates_simple_addition
    calculator = ReversePolishNotation.new
    result = calculator.calculate("12+")
    assert_equal 3, result
  end

  def test_calculates_simple_subtraction
    calculator = ReversePolishNotation.new
    result = calculator.calculate("43-")
    assert_equal 1, result
  end

  def test_calculates_multiple_operators
    calculator = ReversePolishNotation.new
    result = calculator.calculate("123+-")
    assert_equal 0, result
  end

  def test_split_characters
    calculator = ReversePolishNotation.new
    calculator.split_chars_into_nums_and_operators("123+-")
    assert_equal [1,2,3], calculator.numbers
    assert_equal ["+", "-"], calculator.operators 
  end
end