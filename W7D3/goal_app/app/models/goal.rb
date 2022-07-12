# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string
#  details    :string
#  status     :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
    validates :name, :status, :user_id, presence: true
    validates :status, default: false

    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :comments, class_name: "Comment", foreign_key: "goal_id"
end
