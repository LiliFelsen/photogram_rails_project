class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :picture_tags, dependent: :destroy
  has_many :tags, through: :picture_tags
  accepts_nested_attributes_for :tags

  has_attached_file :image, styles: { :medium => "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
