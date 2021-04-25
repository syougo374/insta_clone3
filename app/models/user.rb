class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_validation { email.downcase! }
  has_many :pictures
  has_secure_password
  has_many :favorites, dependent: :destrou
  has_many :favorite_users, through: :favorites, source: :picture

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  has_many :favorites, dependent: :destroy
  validates :password, presence: true, length: { minimum: 6 }
end
