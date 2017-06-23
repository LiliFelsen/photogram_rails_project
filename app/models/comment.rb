class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  validates :content, length: { in: 2..100 }
end
