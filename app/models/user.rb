class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :pictures

  validates_presence_of :email
  validates :email, uniqueness: :true
  validates_presence_of :username
  validates :username, uniqueness: :true
end
