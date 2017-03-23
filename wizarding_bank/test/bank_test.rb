require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'

class BankTest < Minitest::Test

  def test_instance_of_bank
    chase = Bank.new("JP Morgan Chase Bank")
    assert_instance_of Bank, chase
  end
  
  
end
