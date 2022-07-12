require_relative "slideable.rb"

class Bishop < Piece
  include Slideable   #inherits from slideable module
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :B    #bishop symbol will be :B
    to_s
  end

  def to_s      #getter method for symbol?
    color == :black ? @symbol = :♝ : @symbol = :♗
  end

  private
  def move_dirs   #takes the diagonal_moves from slideable module
    diagonal_dirs
  end
end