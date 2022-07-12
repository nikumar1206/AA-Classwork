require_relative 'pieces.rb'

class Board
  PIECES = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  # constant used to get the major pieces of the chess board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
    #create a 2-D Array of board and initialize it with all null pieces
    set_pieces
    #call helper method set pieces to place pieces on the board 
  end

  def set_pieces
    #use helper methods to fill the pawn row and back row
    [:white, :black].each do |color|
      fill_major_pieces(color)  # fills the major pieces based on color
      fill_pawn_pieces(color)   # fills the pawn pieces based on color
    end
  end

  def fill_major_pieces(color)
    color == :white ? row = 7 : row = 0
    # if color is white, row will be 7, else row will be 0
    PIECES.each_with_index do |piece, col| 
      instance = piece.new(color, self, [row, col])
      pos = row, col
      self[pos] = instance
    end
    # iterate through each piece and sets its color, sets the board and it's position
  end

  def fill_pawn_pieces(color)
    color == :white ? row = 6 : row = 1
    # if color is white, row will be 6, else row will be 1
    (0...8).each do |col| 
      instance = Pawn.new(color, self, [row, col])
      pos = row, col
      self[pos] = instance
    end
    # iterate through each piece and sets its color, sets the board and the pawn's position
  end

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(color,start_pos, end_pos)
    #moves piece if the start_pos and end_pos is valid
    raise StandardError.new("Invalid Start Position") if self[start_pos].is_a?(NullPiece)
    # if start position is a null piece, we are not moving anything which will raise the error
    raise StandardError.new("Invalid End Position") unless self[end_pos].is_a?(NullPiece) || self[end_pos].color == self[start_pos].color
    # if end position is not a null piece or if the start_pos and end_pos color are the same another error will be raised
    raise StandardError.new("Not your color!") if self[start_pos].color != color
    
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos] if self[start_pos].moves.include?(end_pos)
  end

  def valid_pos?(pos)
    x,y = pos
    (0..7).include?(x) && (0..7).include?(y)
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)
    in_check?(color) && @rows[find_king(color)].moves.empty?
  end

  def in_check?(color)
    target_pos = find_king(color)
    other_color = color == :white ? :black : :white
    pieces.each do |piece|
      if piece == other_color && piece.moves.include?(target_pos)
        return true
      end
    end
    false
  end

  def find_king(color)
    @rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        return [i,j] if piece.color == color && piece.is_a?(King)
      end
    end
  end

  def pieces
    pieces_array = []
    @rows.each do |row|
      row.each do |piece|
        pieces_array.push(piece) unless piece.is_a?(NullPiece)
      end
    end
    pieces_array
  end

end

b = Board.new
b.move_piece(:white, [6,4], [4,4])
p b.move_piece(:white, [7,3], [3,7])