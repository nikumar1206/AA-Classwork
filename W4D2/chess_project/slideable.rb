module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves      
    #(prints out all the possible moves)
    possible_moves = []

    #call move_dirs to get the possible directions this piece can move into
    #depending on the piece that takes from the module, move_dirs will be different
    moves = move_dirs

    #goes through each direction and pass it to the helper method
    #helper method will return an array of possible moves in that direction
    moves.each do |move|
      dx = move[0]
      dy = move[1]
      possible_moves << grow_unblocked_moves_in_dr(dx, dy)
    end
    possible_moves
  end

  private
  HORIZONTAL_DIRS = [[0,1], [1,0], [0,-1],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]] 

  def move_dirs
    #gets overwritten by subclass
  end

  def grow_unblocked_moves_in_dr(dx, dy)    
    moves_available = []
    # new_row = x + dx
    # new_col = y + dy
    # new_pos = [new_row, new_col]
    # while (new_row.between?(0,7) && new_col.between?(0,7) && (board[new_pos].is_a?(NullPiece)) || board[new_pos].color != color)
    #   moves_available.push(new_pos)
    #   # if board[new_pos].color == color
    #   #   #this is used so we only add a position with an opposite color piece once and the loop will exit
    #   #   #without this we would be able to go through the piece of an opposite color to another space on the map
    #   #   #this avoids that from happening
    #   #   new_row = -1
    #   #   new_col = -1
    #   #   new_pos = [new_row, new_col]
    #   # else
    #   new_row = new_row + dx
    #   new_col = new_col + dy
    #   new_pos = [new_row, new_col]
  #   while (new_x).between?(0,7) && (new_y).between?(0,7)
  #     new_pos = [new_x,new_y]
  #     if board[new_pos].is_a?(NullPiece)
  #       moves_available << new_pos
  #     elsif board[new_pos].color != color
  #       moves_available << new_pos
  #       break
  #     else
  #       break
  #     end
  #     new_x, new_y = x+dx, y + dy
  #   end
  #   moves_available
  end
end


