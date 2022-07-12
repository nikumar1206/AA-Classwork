require_relative "slideable.rb"

class Queen < Piece
  include Slideable #inherits from slideable module
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :Q    #Queen symbol will be Q
    to_s
  end

  def to_s    #getter method for symbol?
    color == :black ? @symbol = :♛ : @symbol = :♕
  end

  private
  def move_dirs
    horizontal_dirs + diagonal_dirs   #takes both the horizontal and diagonal
  end 
end