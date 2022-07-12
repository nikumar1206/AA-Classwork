require_relative "board.rb"
# require "byebug"
class Game
    def initialize
        @board = Board.new
    end

    def play
        puts "Welcome to Towers of Hanoi!"
        @board.render
        until @board.won?
            puts "Enter a stack to change. Enter as number only (1,2,3)"
            input_stack = gets.chomp.to_i
            puts "Where would you like to go?"
            deput_stack = gets.chomp.to_i
            @board.move(input_stack,deput_stack)
            @board.render
        end
        puts "You win, now touch grass."
    end

end