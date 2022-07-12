class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(num)
        @flight_numbers.include?(num) || @flight_numbers.include?(num.upcase)
    end

    def add_flight(str)
        convert = str.upcase
        if !(has_flight?(convert))
            @flight_numbers << convert
        end
    end


end