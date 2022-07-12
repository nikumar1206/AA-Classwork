require_relative "passenger"
class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass_1)
        if !full? && pass_1.has_flight?(@flight_number)
            @passengers << pass_1
        end
    end

    def list_passengers
        @passengers.map {|pass| pass.name }
    end

    def [](index)
        @passengers[index]
    end

    def <<(pass_2)
        board_passenger(pass_2)
    end
    
end