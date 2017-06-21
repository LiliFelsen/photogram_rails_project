class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :pictures

  validates_presence_of :email
  validates :email, uniqueness: :true
  validates_presence_of :username
  validates :username, uniqueness: :true

  has_attached_file :avatar, styles: { :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


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
