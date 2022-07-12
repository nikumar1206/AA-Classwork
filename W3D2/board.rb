require_relative "card"
class Board
    attr_reader :board
    def initialize
        @card_val = Card.make_cards.shuffle
        @board = Array.new(4){Array.new(4, ' ')}
    end

    def populate
        j = 0
        @board.each_with_index do |subarray, idx|
            subarray.each_with_index do |ele, i|
                @board[idx][i] = @card_val[j]
                j += 1
            end
        end
    end

    def empty_board
        play_board = @board.map {|row| row.map {|ele| ele = '' } }
    end

    def bloop!
        play_board.each_with_index do |row, i|
            row.each_with_index do |card, j|
                if play_board[i][j].reveal?
                    play_board[i][j]= @board[i][j].face_val
                else
                    play_board[i][j] = ' '
                end
            end
        end
        play_board
    end

    

    def render
    def [](pos)
        row, col = pos
        @hidden_board[row][col]
    end

    def reveal(pos)
        row, col = pos
        if !@board[row][col].reveal?
            @face_up = false
        else
            @face_up = true
        end
    end


end
b = Board.new
b.render
b.populate
p b.render
