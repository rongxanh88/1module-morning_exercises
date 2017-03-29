class Person
  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
    puts "#{name} has been created with #{cash} galleons in cash"
  end
  
end
