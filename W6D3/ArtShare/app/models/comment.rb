class Comment < ApplicationRecord
  validates :commenter_id, uniqueness: { scope: :body, 
    message: "STOP SPAMMING THE SAME MESSAGE!" }

  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end