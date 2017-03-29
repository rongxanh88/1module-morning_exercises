require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test

  def test_instance_of_bank
    chase = Bank.new("JP Morgan Chase Bank")
    assert_instance_of Bank, chase
  end
  
  def test_create_account
    harry = Person.new("Harry", 10000)
    wells_fargo = Bank.new("Wells Fargo")
    wells_fargo.open_account(harry)
    wells_fargo.accounts.has_key?(harry)  ? account_open = true : account_open = false
    assert account_open
  end
  
  def test_create_duplicate_account
    harry = Person.new("Harry", 10000)
    wells_fargo = Bank.new("Wells Fargo")
    wells_fargo.open_account(harry)
    wells_fargo.open_account(harry)
    
    assert_equal 1, wells_fargo.accounts.size
  end
  
end