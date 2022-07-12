require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system("clear")
    @cursor.get_input
    puts " #{("a".."h").to_a.join(" ")}"
    @board.rows.each_with_index do |row, i|
        print "#{i+1}"
      row.each_with_index do |piece, j|
        pos = i, j

        if @cursor.cursor_pos == pos
          print "#{piece.symbol} ".colorize(:background => :green)
        elsif (j.even? && i.even?) || (j.odd? && i.odd?)
          print "#{piece.symbol} ".colorize(:background => :light_cyan)
        else
          print "#{piece.symbol} ".colorize(:background => :light_magenta)
        end
      end
      puts
    end
  end
end

d = Display.new(Board.new)

d.render