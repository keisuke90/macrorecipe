class Recipe < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, RacipeImageUploader
end
