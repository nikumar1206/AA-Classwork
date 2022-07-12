module Stepable

  def moves   #(finds the possible moves)
    possible_moves = []
    #calls move_dirs to get the possible moves the certain piece can make
    moves = move_diffs

    #A stepable piece can only move once in any of it's valid positions, if available it can move in any direction
    #check each direction and see if it results in a valid move and if it is possible, it will be added to the array
    moves.each do |move|
      new_row = pos[0] + move[0]
      new_col = pos[1] + move[1]
      new_pos = [new_row, new_col]
      possible_moves.push(new_pos) if valid?(new_pos)
    end
    possible_moves
  end

  private
  def valid?(pos)   
    #(asks if the moves is valid)
    # it can only be moved into if it is between 0 and 7 
    #and the current piece that occupies the position is a null piece
    #it can also move there as a capture if it is a different color
    row, col = pos
    row.between?(0,7) && col.between?(0,7) && (board[pos].is_a?(NullPiece) || board[pos].color != self.color)
  end

  def move_diffs
    #(overwritten by subclass)
    # no need to write here
  end
end