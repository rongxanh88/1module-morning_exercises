require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/allergies'

class AllergiesTest < Minitest::Test

  def test_it_exists
    tester = Allergies.new
    assert_instance_of Allergies, tester
  end

  def test_read_allergies
    tester = Allergies.new
    list = {
      "cats" => 128, "pollen" => 64, "chocolate" => 32,
      "tomatoes" => 16, "straberries" => 8, "shellfish" => 4,
      "peanuts" => 2, "eggs" => 1
    }
    assert_equal list, tester.allergy_list
  end

  def test_score_2_is_peanuts
    tester = Allergies.new
    assert_equal "peanuts", tester.score(2)
  end

  def test_score_3_is_peanuts_and_eggs
    tester = Allergies.new
    assert_equal ["peanuts", "eggs"], tester.score(3)
  end

  def test_score_34_is_chocolate_and_peanuts
    tester = Allergies.new
    assert_equal ["chocolate", "peanuts"], tester.score(34)
  end
end