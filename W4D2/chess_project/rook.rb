require_relative "slideable.rb"

class Rook < Piece
  include Slideable #inherits from slideable module
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :R  #rook symbol will be R
    to_s
  end

  def to_s    #getter for rook?
    color == :black ? @symbol = :♜ : @symbol = :♖
  end

  private
  def move_dirs     #takes horizontal dirs from module
    horizontal_dirs
  end
end