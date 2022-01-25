class Recipe < ApplicationRecord
  before_save :calc_ingredients
  
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true, length: { maximum: 255 }
  validates :ingredients, presence: true
  
  mount_uploader :image, RacipeImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients, source: :food
  accepts_nested_attributes_for :steps, reject_if: lambda {|attributes| attributes['explanation'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['quantity'].blank?}, allow_destroy: true
  
  def calc_protein
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.protein * ingredient.quantity
    end
    value
  end
  
  def calc_fat
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.fat * ingredient.quantity
    end
    value
  end
  
  def calc_carbo
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.carbo * ingredient.quantity
    end
    value
  end
  
  def calc_kcal
    value = 0
    ingredients.each do |ingredient|
      value += ingredient.food.kcal * ingredient.quantity
    end
    value
  end
  
  def calc_ingredients
    self.protein = calc_protein.round(1)
    self.fat = calc_fat.round(1)
    self.carbo = calc_carbo.round(1)
    self.kcal = calc_kcal.round(1)
  end
  
end
