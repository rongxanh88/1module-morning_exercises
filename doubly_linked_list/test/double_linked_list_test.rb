require 'simplecov'
SimpleCov.start

require './lib/double_linked_list'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class LinkListTest < Minitest::Test

  def setup
    @list = LinkedList.new(1, 3)
  end
  
  def test_instance_of_linked_list
    assert_instance_of LinkedList, @list
  end
  
  def test_linked_list_has_at_least_two_nodes
    count = 1
    pointer = @list.head
    pointer = pointer.next
    if pointer != @list.head 
      count += 1
    end
    assert_equal 2, count
  end

  def test_if_list_is_circularly_linked
    @list.insert(1)
    @list.insert(2)
    @list.insert(87)
    @list.insert(99)
    turtle = @list.head
    rabbit = @list.head.next

    while turtle != rabbit
      turtle = turtle.next
      rabbit = rabbit.next.next
    end
    
    assert_equal turtle, rabbit
  end
  
  def test_if_double_linked
    pointer = @list.head
    assert_equal @list.head.next, pointer.next
    assert_equal @list.head.previous, pointer.previous
  end

  def test_insert_node
    value = 25
    @list.insert(value)
    inserted_node = @list.head.previous
    previous_node = inserted_node.previous
    assert_equal value, inserted_node.data
    assert_equal @list.head, inserted_node.next
    assert_equal previous_node, inserted_node.previous
  end

  def test_count_method
    @list.insert(99)
    @list.insert(54)
    assert_equal 4, @list.count
  end

  def test_remove_node
    list = LinkedList.new(99, 101)
    list.insert(45)
    list.insert(78)
    assert_equal [99,101,45,78], list.all_values

    list.remove(45)
    assert_equal [99,101,78], list.all_values
  end

  def test_remove_head_node
    list = LinkedList.new(99, 101)
    list.insert(45)
    list.insert(78)
    list.remove(99)

    assert_equal [101,45,78], list.all_values
  end

  def test_remove_last_node
    list = LinkedList.new(99, 101)
    list.insert(45)
    list.insert(78)
    list.remove(78)

    assert_equal [99,101,45], list.all_values
  end
  
  def test_include?
    @list.insert(100)
    @list.insert(101)
    assert @list.include?(101)

    second_list = LinkedList.new(405,99)
    second_list.insert(45)
    refute second_list.include?(78)
  end
end