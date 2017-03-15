def square_then_sum(min_value, max_value)
  sum = (min_value..max_value).to_a.map {|number| number * number}
  return sum.inject {|total, num| total + num}
end

def sum_then_square(min_value, max_value)
  sum = (min_value..max_value).to_a.inject {|total, num| total + num}
  sum = sum * sum
  return sum
end

value1 = square_then_sum(1,100)
value2 = sum_then_square(1,100)
total = value2 - value1

puts "#{value2} - #{value1} = #{total}."