class Pawn < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :P
    to_s
  end 

  def to_s 
    color == :black ? @symbol = :♟ : @symbol = :♙
  end

  #returns the possible moves for the piece that called it
  def moves
    possible_moves = []
    row, col = pos
    possible_moves.push([row+forward_dir, col])
    possible_moves.push([row+forward_steps, col]) if at_start_row?
    possible_moves + side_attacks(pos)
    possible_moves.select {|pos| valid?(pos)}
  end

  private

  def valid?(pos)
    #checks if the pos passed is a valid move. It is only a valid move if it is within
    #the boundaries and if its a null piece
    row, col = pos
    row.between?(0,7) && col.between?(0,7) && board[pos].is_a?(NullPiece)
  end

  def valid_attack?(pos)
    #checks if the position passed in is a valid attack position. It is a valid attack pos
    #if it is within boundaries and it is of the opposite color
    row, col = pos
    row.between?(0,7) && col.between?(0,7) && board[pos].color != color && !board[pos].is_a?(NullPiece)
  end

  def at_start_row? #Returns whether or not the current piece is at the start row
    row, col = pos
    if row == 1 && color == :black
      return true
    elsif row == 6 && color == :white
      return true
    else
      return false
    end
  end

  def forward_dir #should know which direction the pawn has to move based on its color
    row, col = pos
    if color == :black
      return 1
    else
      return -1
    end
  end

  def forward_steps #the number of steps a pawn can move (2 if at start row 1 if not)
    if at_start_row? && forward_dir > 0
      return 2
    elsif at_start_row? && forward_dir < 0
      return -2
    end
  end

  def side_attacks(pos) #Returns an array with the possible diagonal attacks for the current piece
    possible_attacks = []
    row, col = pos

    case color
    when :black
      possible_step_1 = [row+1, col-1]
      possible_step_2 = [row+1, col+1]
      possible_attacks.push(possible_step_1) if valid_attack?(possible_step_1)
      possible_attacks.push(possible_step_2) if valid_attack?(possible_step_2)
    when :white
      possible_step_1 = [row-1, col-1]
      possible_step_2 = [row-1, col+1]
      possible_attacks.push(possible_step_1) if valid_attack?(possible_step_1)
      possible_attacks.push(possible_step_2) if valid_attack?(possible_step_2)
    end
    possible_attacks
  end
end