class Recipe < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, RacipeImageUploader
  
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: lambda {|attributes| attributes['explanation'].blank?}, allow_destroy: true
end
