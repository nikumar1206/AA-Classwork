# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
  # validates :artwork_id, uniqueness: { scope: :viewer_id, 
  #   message: "You cannot see the same artwork!" }

  validates :viewer_id, uniqueness: { scope: :artwork_id, 
    message: "You cannot see the same artwork!" }

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
