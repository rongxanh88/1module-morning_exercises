require 'Prime'

def fibonnaci_seq(n)
  num_seq = []
  fib1 = 0
  fib2 = 1

  (n).times do |iteration|
    if iteration == 0
      num_seq.push(fib1)
      next
    elsif iteration == 1
      num_seq.push(fib2)
      next
    end
    
    fib3 = fib1 + fib2
    num_seq.push(fib3)

    fib1 = fib2
    fib2 = fib3
  end
  
  return num_seq
end

def all_prime_num(numbers)
  prime_numbers = []

  numbers.each do |num|
    if Prime.prime?(num)
      prime_numbers.push(num)
    end
  end
  return prime_numbers
end


puts "#{fibonnaci_seq(25)}"
puts "#{all_prime_num(fibonnaci_seq(25))}"

