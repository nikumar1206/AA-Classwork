require_relative "card.rb"
require_relative "board.rb"
class Game
    attr_reader :board
    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def play
        # @board.render
        self.make_guess
    end

    def make_guess
        puts "Enter a position in the format: 1 2"
        response = gets.chomp.split(' ').map {|ele| ele.to_i}
    end

    def guessed_pos
        if @previous_guess.empty?
            @previous_guess = self.make_guess
        end
    end
end
