require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class PersonTest < Minitest::Test

  def test_instance_of_person
    minerva = Person.new("Minerva", 1000)
    assert_instance_of Person, minerva
  end

  def test_cash_on_person
    luna = Person.new("Luna", 500)
    galleons = luna.cash 
    assert_equal 500, galleons
  end
  
  
end
