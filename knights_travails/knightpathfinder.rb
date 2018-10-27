require '../polytreenode/skeleton/lib/00_tree_node.rb'
  
class KnightPathFinder
  MOVES = [[2, -1], [1, -2], [2, 1], [1, 2], [-2, 1], [-2, -1], [-1, -2], [-1, 2]]
  
  attr_reader :root_node
  attr_writer :visited_positions
  
  # pos = [num1, num2]
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @visited_positions = [pos]
    build_move_tree
  end
  
  # pos = position you're currently on
  # returns an array of valid ending positions
  def self.valid_moves(pos)
    ending_pos = MOVES.select do |move|
      check = [pos[0] - move[0], pos[1] - move[1]]
      if (check[0] < 0 || check[0] > 7) && (check[1] < 0 || check[1] > 7)
        check
      end
    end
    
    ending_pos
  end
  
  def new_move_positions(pos)
    moves_arr = self.class.valid_moves(pos)
    new_moves_arr = []
    
    moves_arr.each do |move|
      new_moves_arr << move unless @visited_positions.include?(move)
    end 
    
    new_moves_arr
  end
  
  def build_move_tree
    
  end
  
end