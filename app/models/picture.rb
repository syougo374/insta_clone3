class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :content, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
