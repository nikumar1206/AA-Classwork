require 'action_view'
include ActionView::Helpers::DateHelper
class Cat < ApplicationRecord
    validates :birth_date, :color, :sex, :name, :description, presence: true
    validates :color, inclusion: { in: %w(white blue green yellow brown black ginger), 
        message: "%{color} is not a valid color!" }

    def age
        @age = Time.now.year -  Cat.birth_date.year
    end

    has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CarRentalRequest,
    dependent: :destroy
end
