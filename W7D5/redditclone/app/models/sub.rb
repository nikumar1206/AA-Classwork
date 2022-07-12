class Sub < ApplicationRecord
    belongs_to :Mod,
        class_name: :User,
        foreign_key: :mod_id

    has_many :post_subs

    has_many :posts,
    through: :post_subs,
    source: :post
end
