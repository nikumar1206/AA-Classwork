require_relative "stepable.rb"

class Knight < Piece
  include Stepable  #inherits from stepable module
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :N  #Knight symbol as :N
    to_s
  end

  def to_s  #getter method for symbol?
    color == :black ? @symbol = :♞ : @symbol = :♘
  end

  private
  def move_diffs  #move_diffs (overwritten by subclass)
    [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
  end
end