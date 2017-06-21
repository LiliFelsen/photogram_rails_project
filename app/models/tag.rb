class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  def self.most_popular
    sorted_tags = Tag.all.sort_by {|tag| -tag.pictures.length}
    top_3 = sorted_tags[0..2]
    top_3.map {|t| t.name}
  end

  def self.trending
    last_posted = Picture.last(10)
    tags = []
    last_posted.each do |pic|
      pic.tags.map {|tag| tags << tag.name}
    end
    tags.group_by(&:itself).values.max_by(&:size).first
  end

end
