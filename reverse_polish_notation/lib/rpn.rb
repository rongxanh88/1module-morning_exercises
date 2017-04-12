class ReversePolishNotation
  attr_accessor :numbers, :operators

  def initialize
    @numbers = []
    @operators = []
  end

  def calculate(entry)
    split_chars_into_nums_and_operators(entry)
    total = numbers.shift
    while !operators.empty? do
      operator = operators.shift
      case operator
      when "+"
        total = total + numbers[0]
      when "-"
        total = total - numbers[0]
      end
      numbers.shift
    end
    total
  end

  def split_chars_into_nums_and_operators(characters)
    chars = characters.split("")
    chars.each do |char|
      if char == "+" or char == "-"
        operators << char
      else
        numbers << char.to_i
      end
    end
  end
end