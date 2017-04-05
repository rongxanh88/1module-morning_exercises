require './lib/node'

class LinkedList
  attr_reader :head
  def initialize(data1, data2)
    @head = Node.new(data1)
    @head.next = Node.new(data2)
    @head.previous = head.next

    other_node = head.next
    other_node.next = head
    other_node.previous = head
  end
  
  def insert(data)
    new_node = Node.new(data)
    head_node = head
    last_node = head.previous

    last_node.next = new_node
    new_node.previous = last_node
    new_node.next = head_node
    head_node.previous = new_node
  end

  def remove(data)
    current_node = head
    next_node = head.next
    previous_node = head.previous
    revolutions = 0

    while revolutions < 1
      if current_node.data == data
        previous_node.next = next_node
        next_node.previous = previous_node
        @head = next_node if current_node == head
        return head
      end
      
      previous_node = current_node
      current_node = next_node
      next_node = next_node.next

      if current_node == head
        revolutions = 1
      end
    end
    return head
  end

  def count
    count = 1
    pointer = head.next
    while pointer != head
      count += 1
      pointer = pointer.next
    end
    count
  end

  def include?(value)
    return true if head.data == value
    pointer = head.next
    
    while pointer != head
      return true if pointer.data == value
      pointer = pointer.next
    end
    return false
  end
  
  def all_values
    values = []
    pointer = head.next
    values.push (head.data)

    while pointer != head
      values.push(pointer.data)
      pointer = pointer.next
    end
    values
  end
end
