class AddColumnsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :protein, :float
    add_column :recipes, :fat, :float
    add_column :recipes, :carbo, :float
    add_column :recipes, :kcal, :float
  end
end
