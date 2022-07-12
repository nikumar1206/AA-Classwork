class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n * n
    end
    def size
        @size
    end

    def [](arr)
        pos = @grid[arr[0]][arr[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
       ship_num = @grid.flatten.length * 0.25
       while num_ships() < ship_num
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        pos = [row, col]
        self[pos]= :S
       end
    end

    def hidden_ships_grid
        @grid.map { |row| row.map {|ele| ele ==:S ? :N : ele} }
    end

    def self.print_grid(arr)
        arr.each { |row| puts row.join(' ')}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

