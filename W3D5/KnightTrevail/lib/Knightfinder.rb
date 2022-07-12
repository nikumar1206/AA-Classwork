require_relative "00_tree_node"
class KnightFinder
  attr_reader :considered_pos, :original_pos, :root_node

  def initialize(pos)
    @original_pos = pos
    @considered_pos = [@original_pos]
    @root_node = PolyTreeNode.new(@original_pos, @original_pos)
  end


  def find_path(target_pos)

  end

  def build_move_tree(target_pos)
    queue = []
    queue << @root_node
    possible_paths = []
    
    until queue.empty?
      check = queue.shift
      if check.value == target_pos
        possible_paths << return_path(check)
      else 
        new_positions = new_move_positions(check.value)
        new_positions.each do |new_pos| 
          new_position_node = PolyTreeNode.new(new_pos, @original_pos)
          check.add_child(new_position_node)
          queue << new_position_node
          @considered_pos << new_pos if !@considered_pos.include?(new_pos)
        end
      end
    end
    reset_pos()
    return possible_paths.min { |path| path.length }
  end
  
  def return_path(destination_node)
    path = []
    check = destination_node
    until check.parent == nil
      path.unshift(check.value)
      check = check.parent
    end
    return path.unshift(@original_pos)
  end

  def reset_pos()
    @considered_pos = [@original_pos]
  end

  def new_move_positions(pos)
    possibles = KnightFinder.valid_moves(pos)
    possibles = possibles.select { |possible| !@considered_pos.include?(possible)}
    p possibles
    return possibles
    #reject { |position| @considered_pos.include?(position)}
  end

  def self.valid_moves(pos)
    x,y = pos
    moves = []
    [-2,-1,1,2].each do |move_x|
      [-2,-1,1,2].each do |move_y|
        new_pos_x = x + move_x
        new_pos_y = y + move_y
        next if !(0..7).include?(new_pos_x) || !(0..7).include?(new_pos_y) || move_x.abs == move_y.abs
        moves << [new_pos_x, new_pos_y]
      end
    end
    return moves
  end
end

# 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