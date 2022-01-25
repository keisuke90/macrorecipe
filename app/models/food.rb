class Food < ApplicationRecord
  has_many :ingredients
  
  def self.import(file)
    unless file
      
    else
        CSV.foreach(file.path, headers: true) do |row|
          food = Food.new
          food.attributes = row.to_hash.slice(*updatable_attributes)
          food.save!(validate: false)
        end
    end
  end

  def self.updatable_attributes
    ['name', 'kcal', 'protein', 'fat', 'carbo']
  end
end
