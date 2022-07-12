class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    return :Piece
  end

  def empty?
    board[pos].is_a?(NullPiece)
  end

  def moves #(returns an array of all the valid moves of a piece)
    #Of course, every piece will move differently, so you can't write (implement) 
    #the #moves method of Piece without subclasses.
  end

  def pos=(val) #setter method for pos
    @pos = val
  end

  def Symbol

  end

  def move_into_check?(end_pos)

  end

end