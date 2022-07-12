class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? { |row| row.length == @size && row.all? {|ele| ele == mark } }
    end

    def complete_col?(mark)
        arr = @grid.transpose
        arr.any? { |col| col.length == @size && col.all? {|ele| ele == mark } }
    end

    def complete_diag?(mark)
        first_diag = []
        second_diag = []
        (0...size).each do |col|
            (0...size).each do |row|
                first_diag << @grid[col][row] if col == row
                second_diag << @grid[col][-row-1] if col == row
            end
        end
        first_diag.all?(mark) || second_diag.all?(mark)
    end

    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
