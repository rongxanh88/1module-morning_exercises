require 'pry'
class WordFinder
  def words
    @dictionary = File.read('/usr/share/dict/words').split("\n")
  end

  def for_letters(letters)
    compatible_words = []
    @dictionary.each do |word|
      next if word.length > letters.size
      found_match = true
      split_word = word.split("")
      temp_letters = Array.new(letters)
      split_word.each do |letter|
        if !temp_letters.include?(letter)
          found_match = false
          break
        elsif temp_letters.include?(letter)
          index = temp_letters.find_index(letter)
          temp_letters.delete_at(index)
        end
      end
      compatible_words.push(word) if found_match
    end
    compatible_words
  end

end
