# require "byebug"

class Board
    attr_reader :stack1, :stack2, :stack3

    def initialize
        @stack1 = [[1],[2],[3],[4],[5]]
        @stack2, @stack3 = [], []       
    end

    def render
        @stack1.each do |tile|
            puts tile.join("")
            puts
        end
        @stack2.each do |tile|
            puts tile.join("")
            puts
        end
        @stack3.each do |tile|
            puts tile.join("")
            puts
        end
    end
    
    def won?
        og = [[1],[2],[3],[4],[5]]
        @stack2 == og || @stack3 == og
    end

    def move(start_stack, end_stack)
        first_stack_parsed = parse_input(start_stack)
        second_stack_parsed = parse_input(end_stack)
        first_move = first_stack_parsed.shift
        second_stack_parsed.unshift(first_move)
    end

    def parse_input(input)
        if input == 1
            @stack1
        elsif input == 2
            @stack2
        elsif input == 3
            @stack3
        else
            raise "YSMF"
        end
    end
end