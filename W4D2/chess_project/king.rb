require_relative "stepable.rb"

class King < Piece
  include Stepable #inherits from stepable module
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :K  #King symbol as :K
    to_s
  end

  def to_s  #getter method for symbol?
    color == :black ? @symbol = :♚ : @symbol = :♔
  end

  private
  def move_diffs  #move_diffs (overwritten by subclass)
    [[0,1], [1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1]]
  end
end