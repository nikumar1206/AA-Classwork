require_relative "piece.rb"
require "singleton"
class NullPiece < Piece
  # null piece will inherit from piece
  include Singleton
  # singleton makes it so it is a single instance
  attr_reader :color, :symbol

  def initialize
    @symbol = " "
    @color = :nil
  end

  def moves   #(empty should print out available moves)

  end

  def to_s    #getter method for symbol?
    @symbol
  end

end