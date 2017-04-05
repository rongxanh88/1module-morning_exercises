require 'pry'

class Board
  attr_accessor :board
  def initialize(size)
    matrix = Array.new(size) {|row| Array.new(size) {|element| element = "dead"}}
    @board = matrix
  end

  def size
    length = board[0].length
  end
  
  def get_element(outer_index, inner_index)
    return board[outer_index][inner_index]
  end
  
  def set_element(outer_index, inner_index, element)
    board[outer_index][inner_index] = element
  end
  
  def find_live_cells
    locations = []
    board.each_with_index do |row, outer_index|
      row.each_with_index do |element, inner_index|
        if element == "alive"
          locations << [outer_index, inner_index]
        end
      end
    end
    locations
  end

  def find_neighbor_indexes(life="dead", first_index, second_index)
    neighbors = []
    board.each_with_index do |row, out_index|
      row.each_with_index do |element, in_index|
        if ((out_index - first_index).abs <= 1) and ((in_index - second_index).abs <= 1)
          if (out_index == first_index) and (in_index == second_index)
            #do nothing
          elsif element == life
            neighbors << [out_index, in_index]
          end
        end
      end
    end
    neighbors.size
  end
  
end

class MutateBoard
  attr_accessor :input_board, :output_board

  def initialize(input_board)
    @input_board = input_board
    board_size = input_board.size
    @output_board = Board.new(board_size)
  end

  def set_seed(outside_array, inside_array)
    input_board.set_element(outside_array, inside_array, "alive")
    output_board = input_board
  end
  
  def check_live_cells
    less_than_two_neighbors
    two_or_three_neighbors
    more_than_three_neighbors
  end

  def less_than_two_neighbors
    live_cells = input_board.find_live_cells
    live_cells.each do |cell|
      first_index = cell[0]
      second_index = cell[1]
      num_neighbors = input_board.find_neighbor_indexes("alive", first_index, second_index)
      if num_neighbors < 2
        output_board.set_element(first_index, second_index, "dead")
      end
    end
  end

  def two_or_three_neighbors
    live_cells = input_board.find_live_cells
    live_cells.each do |cell|
      first_index = cell[0]
      second_index = cell[1]
      num_neighbors = input_board.find_neighbor_indexes("alive", first_index, second_index)
      if num_neighbors == (2 or 3)
        output_board.set_element(first_index, second_index, "alive")
      end
    end
  end

  def more_than_three_neighbors
    live_cells = input_board.find_live_cells
    live_cells.each do |cell|
      first_index = cell[0]
      second_index = cell[1]
      num_neighbors = input_board.find_neighbor_indexes("alive", first_index, second_index)
      if num_neighbors > 3
        output_board.set_element(first_index, second_index, "dead")
      end
    end
  end
  
end

binding.pry