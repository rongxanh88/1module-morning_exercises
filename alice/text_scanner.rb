class TextScanner
  attr_accessor :file
  def initialize(file_name)
    if !file_name.nil?
      read_file(file_name)
    end
  end

  def read_file(file_name)
    @file = File.new(file_name)
  end

  def word_count
    words = file.read.split(' ').to_a
    words.map {|word| word.gsub!(/[^A-Za-z]/, '')}
    dictionary = Hash.new
    words.each do |word|
      if dictionary.has_key?(word)
        dictionary[word] += 1
      else
        dictionary[word] = 1
      end
    end
    dictionary
  end
  
  def most_popular_word
    word_count
  end
  
end

t = TextScanner.new("./alice.txt")
#t.word_count
t.most_popular_word