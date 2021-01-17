class Movie < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  def self.search(name)
    where("note like ?", "%#{name}%")
  end

end
