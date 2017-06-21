class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :pictures

  validates_presence_of :email
  validates :email, uniqueness: :true
  validates_presence_of :username
  validates :username, uniqueness: :true

  def received_comments
    my_comments = []
    self.pictures.each do |picture|
      picture.comments.each do |comment|
        if comment.user_id != self.id
        my_comments.push(comment)
        end
      end
    end
    my_comments
  end

end
