class Recipe < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, RacipeImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients, source: :food
  accepts_nested_attributes_for :steps, reject_if: lambda {|attributes| attributes['explanation'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['quantity'].blank?}, allow_destroy: true
end
