class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :picture_tags, dependent: :destroy
  has_many :tags, through: :picture_tags
  accepts_nested_attributes_for :tags
  validates :title, presence: true
  validates :image_url, presence: true
end
