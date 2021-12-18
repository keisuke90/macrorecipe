class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :kcal
      t.float :protein
      t.float :fat
      t.float :carbo

      t.timestamps
    end
  end
end
