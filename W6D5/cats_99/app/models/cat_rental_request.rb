class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: { in: %w(APPROVED DENIED PENDING),
        message: "nah thats the wrong status!" 
    }

    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

    def requests
        CatRentalRequest
            .select('*')
            .joins(:cat)
            .where("cat_id = cats.id")
            .order("start_date ASC")
            # .pluck(:start_date, :end_date)
    end
    
end
