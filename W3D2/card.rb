class Card
    attr_reader :face_val, :face_up
    @@card_val = [:A,:B,:C,:D,:E,:F,:G,:H, :A,:B,:C,:D,:E,:F,:G,:H]
    def initialize(face_val)
        @face_val = face_val
        @face_up = false
    end

    def reveal?
        @face_up = true
    end

    def hide?
        @face_up = false
    end

    def ==(card_1, card_2)
        card_1.face_val == card_2.face_val
    end
    
    def self.make_cards
        all_cards = []
        @@card_val.each do |val|
            all_cards << Card.new(val)
        end
        all_cards
    end

end