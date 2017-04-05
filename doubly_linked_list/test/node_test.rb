require 'simplecov'
SimpleCov.start

require './lib/node'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

  def setup
    @head = Node.new(5)
  end
  
  def test_instance_of_node
    assert_instance_of Node, @head
  end

  def test_node_has_value
    assert_equal 5, @head.data 
  end
  
  def test_node_has_pointers
    assert_nil @head.next
    assert_nil @head.previous
  end
end
