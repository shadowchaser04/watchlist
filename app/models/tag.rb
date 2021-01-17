class Tag < ApplicationRecord

has_many :taggings
has_many :movies, through: :taggings

end
