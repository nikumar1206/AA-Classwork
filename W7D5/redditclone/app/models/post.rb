class Post < ApplicationRecord

  validates :title, presence: true
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :postsubs
  
  has_many :subs,
  through: :postsubs
end
