class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
