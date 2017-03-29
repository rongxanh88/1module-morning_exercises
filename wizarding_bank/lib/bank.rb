require './lib/person'

class Bank
attr_reader :bank_name
attr_accessor :accounts

  def initialize(bank_name)
    @bank_name = bank_name
    @accounts = Hash.new
    puts "#{bank_name} has been created."
  end
  
  def open_account(person)
    name = person.name
    if accounts.has_key?(name)
      puts "Account already created"
    else
      accounts[name] = 0
    end
    puts "An account for #{name} with #{bank_name}."
  end
  
end
