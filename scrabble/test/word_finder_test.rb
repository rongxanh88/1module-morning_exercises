gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test

  def test_it_exits?
    wf = WordFinder.new
    assert_instance_of WordFinder, wf
  end

  def test_it_can_read_dictionary
    wf = WordFinder.new
    dictionary = wf.words
    expected = File.read('/usr/share/dict/words').split("\n")
    assert_equal expected, dictionary
  end

  def test_find_words_with_letters
    letters = ['r', 'e', 'x', 'a', 'p', 't', 'o']
    wf = WordFinder.new
    wf.words
    result = wf.for_letters(letters)
    assert_equal 141, result.count
  end
end
