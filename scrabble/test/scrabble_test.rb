gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_word
    assert_equal 8, Scrabble.new.score("hello")
  end
end
