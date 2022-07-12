class Board
    def initialize
        @grid = Array.new(3) { Array.new(3,'_') }
    end

    def valid?(pos)
        row, col = pos
        !((@grid[row][col]).nil?)
    end
    
    def empty?(pos)
        row, col = pos
        (@grid[row][col]) == "_"
    end

    def place_mark(pos, mark)
        row, col = pos
        if !(empty?(pos)) || !(valid?(pos))
            raise "What are u doing stepbro?"
        else
            @grid[row][col] = mark
        end
    end

    def print
        @grid.each { |row| puts row.join(' ') }
    end
    
    def win_row?(mark)
        @grid.any? { |row| row.all? {|ele| ele == mark } }
    end

    def win_col?(mark)
        arr = @grid.transpose
        @grid.any? { |col| col.all? {|ele| ele == mark } }
    end

    def win_diagonal?(mark)
        first_diag, sec_diag = [], []
        len = @grid.length
        (0...len).each do |col|
            (0...len).each do |row|
                first_diag << @grid[col][row] if col == row
                second_diag << @grid[col][-row-1] if col == row
            end
        end
        first_diag.uniq.length == 1 || sec_diag.uniq.length == 1
    end

    def win?
        win_col? || win_row? || win_diagonal?
    end

    def empty_positions?
        @grid.flatten.count('_') >= 1
    end

end
