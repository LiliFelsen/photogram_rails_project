class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  def self.most_popular
    sorted_tags = Tag.all.sort_by {|tag| -tag.pictures.length}
    sorted_tags[0..2]
  end

  def self.trending
  end

end
