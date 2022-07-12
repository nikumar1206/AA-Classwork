class Board
    attr_reader :max_height
    def self.build_stacks(num)
        x = Array.new(num) { Array.new(0)}
    end

    def initialize(stack_num, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(stack_num)
        if stack_num < 4 || max_height < 4
            raise "rows and cols must be >= 4"
        end
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.any? {|stack| stack.length > 4 && stack.all? {|ele| ele == token} }
    end

    def horizontal_winner?(token)
        (0...@stacks[0].length).each do |col|
            horiz = []
            (0...@stacks.length).each do |row|
                horiz << @stacks[row][col] if @stacks[row][col] == token
                if horiz.length == @stacks.length
                    return true
                end
            end
        end
        return false
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end
    

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end