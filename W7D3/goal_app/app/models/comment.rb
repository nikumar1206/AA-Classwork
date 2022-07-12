# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    # validates :author_id, :goal_id, presence: true

    # belongs_to :author, class_name: "User", foreign_key: "author_id"
    # belongs_to :goal, class_name: "Goal", foreign_key: "goal_id"
end
