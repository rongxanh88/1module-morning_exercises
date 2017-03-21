def reverse_string(word)
  word = word.split("").to_a
  reversed_word = []
  word.each do |letter|
    reversed_word.unshift(letter)
  end
  reversed_word
end

reverse = reverse_string("Hello World")
puts "#{reverse}"