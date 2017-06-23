class User < ApplicationRecord
  acts_as_voter

  has_secure_password
  has_many :comments
  has_many :pictures, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  validates_presence_of :email
  validates :email, uniqueness: :true
  validates_presence_of :username
  validates :username, uniqueness: :true

  has_attached_file :avatar, styles: { :large => "300x300#", :medium => "152x152#", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

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
