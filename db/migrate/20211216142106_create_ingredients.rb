class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
