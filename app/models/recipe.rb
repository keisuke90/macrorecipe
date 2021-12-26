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
  
  def protein
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.protein * ingredient.quantity
    end
    value
  end
  
  def fat
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.fat * ingredient.quantity
    end
    value
  end
  
  def carbo
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.carbo * ingredient.quantity
    end
    value
  end
end
