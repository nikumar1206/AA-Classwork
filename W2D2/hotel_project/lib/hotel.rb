require_relative "room"
class Hotel
    def initialize(str, hash_rooms)
        @name = str
        @rooms = {}
        hash_rooms.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name
        f_str = []
        @name.split(' ').each do |word|
            f_str << word[0].upcase + word[1..]
        end
        f_str.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(str)
        @rooms.include?(str)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(name)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end

        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full? }
    end

    def list_rooms
        @rooms.each { |name,room| puts "#{name} : #{room.available_space}" }
    end

end
